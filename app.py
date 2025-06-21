from flask import Flask, render_template, redirect, url_for, request, session, flash
from werkzeug.security import generate_password_hash, check_password_hash
from flask_mysqldb import MySQL
import MySQLdb.cursors
from flask import Flask, render_template, request, jsonify
import cv2
import numpy as np
import base64
from PIL import Image, ImageOps
from tensorflow.keras.models import load_model
app = Flask(__name__)
app.secret_key = 'your_secret_key'  # Replace with your secret key
# MySQL configurations
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'YourNewPassword'
app.config['MYSQL_DB'] = 'mydb'
# Initialize MySQL
mysql = MySQL(app)
# In-memory storage for users
users = {}

# Routes
@app.route('/')
def home():
    return redirect(url_for('login'))

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form.get('username')  # Use get() to avoid KeyError
        password = request.form.get('password')  # Use get() to avoid KeyError
        mobile = request.form.get('mobile')
        email = request.form.get('email')
        full_name = request.form.get('full_name')
        gender = request.form.get('gender')

        # Check if the user already exists
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM users WHERE username = %s', (username,))
        account = cursor.fetchone()

        if account:
            flash('Username already exists!')
        else:
            # Store the plain text password in the database
            #cursor.execute('INSERT INTO users (username, password) VALUES (%s, %s)', (username, password))
             # Store the plain text password in the database
            cursor.execute('INSERT INTO users (username, password, full_name, mobile, email, gender) VALUES (%s, %s, %s, %s, %s, %s)', 
                           (username, password, full_name, mobile, email, gender))
          
            mysql.connection.commit()
            #flash('Registration successful! Please log in.')
            flash('Registration successful! Welcome, {}!'.format(full_name), 'success')
             
            return redirect(url_for('register'))
            

    #return render_template('register.html')
    return render_template('register.html') 


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']  # Get the plain text password

        # Check if the user exists and verify the plain text password
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM users WHERE username = %s', (username,))
        account = cursor.fetchone()

        if account and account['password'] == password:
            # If credentials match, store the user in session and redirect to dashboard
            session['username'] = username
           # flash('Login successful! Welcome back, {}!'.format(account['full_name']), 'success')
            return redirect(url_for('dashboard'))
        else:
            flash('Invalid credentials. Please try again.', 'danger')

    # If request method is GET, show the login page
    return render_template('login.html')




@app.route('/dashboard')
def dashboard():
    if 'username' not in session:
        flash('You need to log in first.')
        return redirect(url_for('login'))

    #return render_template('dashboard.html', username=session['username'])
    return render_template('dashboard.html', username=session['username'])

@app.route('/logout')
def logout():
    session.pop('username', None)
    flash('You have been logged out.')
    return redirect(url_for('login'))

@app.route('/checksymptoms', methods=['GET', 'POST'])
def checksymptoms():
     # Query the typemudra table for dropdown values
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT type FROM typemudra")  # Replace 'type' with your column name
    typemudra_data = cursor.fetchall()
    mudra_info = None  # Default value for when no data is selected

    if request.method == 'POST':
        # Get the selected type from the form
        selected_type = request.form['type']
        
          # Query the database for MudraName and Benefits based on selected type
        cursor.execute("SELECT MudraName, Benefits FROM typemudra WHERE type = %s", (selected_type,))
        mudra_info = cursor.fetchone()  # Fetch the result (single row)
         # return render_template('checksymptoms.html')
    return render_template('checksymptoms.html', typemudra_data=typemudra_data, mudra_info=mudra_info, username=session['username'])

@app.route('/turnoncamera', methods=['GET', 'POST'])
def turnoncamera():
    # Logic for turning on the camera
    return render_template('turnoncamera.html',username=session['username'])

 
 

 

# Load the emotion model
try:
    model = load_model('keras_model.h5')  # Ensure this model exists in your directory
    data = np.ndarray(shape=(1, 224, 224, 3), dtype=np.float32)
    with open("labels.txt", "r") as file:
        class_names = [line.strip() for line in file.readlines()]
except Exception as e:
    print(f"Error loading model: {e}")

# Emotion labels based on typical emotion detection models
    


 
@app.route('/detectcamera')
def detectcamera():
    # Logic for turning on the camera
    return render_template('detectcamera.html',username=session['username'])
   # return Response(detectcamera(), mimetype='multipart/x-mixed-replace; boundary=frame')


@app.route('/predict', methods=['POST']) 
def predict_emotion():
    try:
        # Get the image from the frontend (base64)
        image_data = request.form['image']
        
        # Convert base64 to OpenCV format
        encoded_data = image_data.split(',')[1]
        decoded_data = np.frombuffer(base64.b64decode(encoded_data), dtype=np.uint8)
        image = cv2.imdecode(decoded_data, cv2.IMREAD_COLOR)
        image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        
        # Resize the image to 224x224 for the model
        size = (224, 224)
        image = Image.fromarray(image)
        image = ImageOps.fit(image, size, Image.Resampling.LANCZOS)
        image_array = np.asarray(image)
        normalized_image_array = (image_array.astype(np.float32) / 127.5) - 1
        data[0] = normalized_image_array
        
        # Make the prediction
        prediction = model.predict(data)
        mudra_index = np.argmax(prediction[0])
        mudra_name = class_names[mudra_index]

        # Assuming the bounding box coordinates (if available) - set some dummy values for now.
        # You can adapt this based on how you detect bounding boxes.
        # box = {"x": 50, "y": 50, "width": 150, "height": 150}

        return jsonify({
            'Mudra': mudra_name,
            #'box': box  # Send back the box details
        })

    except Exception as e:
        print(f"Error in /predict: {e}")
        return jsonify({'error': 'An error occurred during Yog Mudra prediction'})


@app.route('/predict', methods=['POST']) 
def predict():
    try:
        # Get the image from the frontend (base64)
        image_data = request.form['image']
        
        # Convert base64 to OpenCV format
        encoded_data = image_data.split(',')[1]
        decoded_data = np.frombuffer(base64.b64decode(encoded_data), dtype=np.uint8)
        image = cv2.imdecode(decoded_data, cv2.IMREAD_COLOR)
        image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        
        # Resize the image to 224x224 for the model
        size = (224, 224)
        image = Image.fromarray(image)
        image = ImageOps.fit(image, size, Image.Resampling.LANCZOS)
        image_array = np.asarray(image)
        normalized_image_array = (image_array.astype(np.float32) / 127.5) - 1
        data[0] = normalized_image_array
        
        # Make the prediction
        prediction = model.predict(data)
        mudra_index = np.argmax(prediction[0])
        mudra_name = class_names[mudra_index]

        # Assuming the bounding box coordinates (if available) - set some dummy values for now.
        # You can adapt this based on how you detect bounding boxes.
        box = {"x": 50, "y": 50, "width": 150, "height": 150}

        return jsonify({
            'Mudra': mudra_name,
            'box': box  # Send back the box details
        })

    except Exception as e:
        print(f"Error in /predict: {e}")
        return jsonify({'error': 'An error occurred during Yog Mudra prediction'})


        
if __name__ == '__main__':
    app.run(debug=True)
