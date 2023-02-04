import React from 'react'
import styles from '../../public/css/components/Slideshow.module.css'

export default class Slideshow extends React.Component {
    constructor(props) {
        super();

        this.state = {
            slideIndex: 0,
        }
    }

    render() {

        const curPath = "/Images/TenaSensor/";
        const picPaths = ["Loading.png", "LogInOptions.png", "SignIn.png", "Register.png", "ConnectToSensor.png", "SelectSensor.png", "FirstCalibration.png", "SelectExercise.png", "ExerciseInProgress.png",];
        const title = ["Loading", "Sign-In Methods", "Sign-In Page", "Register Page", "Home Page", "Device Selection", "Sensor Calibration", "Sensor Exercises", "Performing the Trials"];
        const desc = ["When the user opens the app, the user will be greeted with a screen depicting the app's logo and slogan.\nThe user will not need to do anything during this time and should be taken to the next page after ~3 seconds."
            , "The user will be asked to sign in before using the app. They will have 4 options: Sign In, Register, Register with Google, and Register with LinkedIn."
            , "The user will be asked to enter their existing username and password."
            , "The user will be asked to enter their desired username and a qualifying password."
            , "This is the main page where the user will interact with the T'ena Sensor.\nHere the user shall connect to the sensor, calibrate the sensor, and perform exercises.\nThe app will also display whether or not a T'ena Sensor is currently connected to the app."
            , "The user shall select which Bluetooth device they wish to connect to. Both the device's name and its MAC address will be displayed."
            , "Before performing any exercises with the sensor, the user should first calibrate the sensor to eliminate any inertial drift that the sensor may be exhibiting. While this step is optional, failing to calibrate the sensor may reduce the accuracy of collected data caused by an offset in IMU values.\nThe user will be required to keep the sensor still for a few seconds; First while the sensor is flat, then while it is on its side."
            , "The user will be presented with a set of exercises they shall perform. The exercises can be completed in any order.\nThe exercises that must be completed are Block Placing, Finger To Nose, Cup Drinking, and Rod Placing."
            , "The user will need to perform 5 trials for the exercise they selected in the Sensor Exercises page.\nFirst, the user will be required to keep their hand steady for 3 seconds before they will perform the exercise.\nAfter the timer is complete, the user can perform the exercise as described in the instructions. When the exercise is complete, the user shall select Stop Data Collection to end the trial.\nThe app will display the progress that the user has made with the current exercise. The user can either select Next Trial to repeat the exercise for another trial or they can return to the Exercise Selection page by selecting Exit Exercise."];

        return (
            <>
                <div class="images-container">
                    <div class="image-container">
                        <img src={curPath + picPaths[this.state.slideIndex]} alt="" width="170" />
                    </div>
                    <div class="text-container">
                        <p id="description">{desc[this.state.slideIndex]}</p>
                    </div>
                </div>
                <h2 id="title">{title[this.state.slideIndex]}</h2>
                <div class="center">
                    <button class={styles.slide_button} onClick={() => { this.setState({ slideIndex: this.state.slideIndex === 0 ? picPaths.length - 1 : this.state.slideIndex - 1 }) }}>&lt;</button>
                    <button class={styles.slide_button} onClick={() => { this.setState({ slideIndex: this.state.slideIndex + 1 === picPaths.length ? 0 : this.state.slideIndex + 1 }) }}>&gt;</button>
                </div>
            </>

        )

    }
}