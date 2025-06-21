# 🧘‍♀️ YogaMudra Recommendation System

[![Python](https://img.shields.io/badge/Python-3.10-blue)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/Flask-Web--Framework-lightgrey)](https://flask.palletsprojects.com/)
[![OpenCV](https://img.shields.io/badge/OpenCV-RealTime--Detection-green)](https://opencv.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A computer vision-powered web app that recommends **yoga mudras** based on user-input symptoms and validates real-time posture using webcam-based pose detection. Designed to promote preventive health and mindfulness practices.

---

## 🔍 Features

- 🧠 **Symptom-based Yoga Mudra Recommendations**
- 🎥 **Real-time Webcam Pose Detection**
- 🤖 **Pose Verification using Deep Learning (VGG16)**
- 🌐 **Web UI Built with Flask**
- 📦 Clean and modular code structure for easy maintenance

---

## 🛠️ Tech Stack

| Component        | Technology Used          |
|------------------|--------------------------|
| Language          | Python 3.10              |
| Backend Framework | Flask                   |
| Computer Vision   | OpenCV, Haarcascade      |
| Deep Learning     | VGG16 (Keras/TensorFlow) |
| Frontend          | HTML, CSS, Bootstrap     |
| Database          | SQLite (optional)        |

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/siddhi-patil-06/Yogamudra-Recommendation-sytem.git
cd Yogamudra-Recommendation-sytem
## 🚀 Getting Started

### 2. Create Virtual Environment

```bash
python -m venv venv
# On Windows:
venv\Scripts\activate
# On Linux/macOS:
source venv/bin/activate
## 📦 Installation

### 3. Install Dependencies

```bash
pip install -r requirements.txt
### 4. Run the Application

```bash
python app.py
## 🧠 How It Works

1. **User Inputs Symptoms**  
   → The system suggests appropriate yoga mudras based on mapped symptom rules.

2. **Pose Detection via Webcam**  
   → Utilizes Haar cascades and OpenCV to detect the user's body posture in real time.

3. **Pose Verification with VGG16**  
   → Captured frame is passed to a pre-trained VGG16 model to classify the performed yoga pose.

4. **Real-Time Feedback**  
   → Application provides instant guidance on pose correctness and alignment.

## YogaMudra-Recommendation-sytem/
├── app.py
├── static/
│   ├── css/
│   ├── images/
│   └── ...
├── templates/
│   └── index.html
├── haarcascade_frontalface_default.xml
├── vgg_model.h5
├── labels.txt
├── flask_app.sql
└── requirements.txt

