import React from "react";

function TenaSensor() {

    let curPath = "/Images/TenaSensor/";
    let picPaths = ["Loading.png", "LogInOptions.png", "SignIn.png", "Register.png", "ConnectToSensor.png", "SelectSensor.png", "FirstCalibration.png", "SelectExercise.png", "ExerciseInProgress.png",];
    let title = ["Loading", "Sign-In Methods", "Sign-In Page", "Register Page", "Home Page", "Device Selection", "Sensor Calibration", "Sensor Exercises", "Performing the Trials"];
    let desc = ["When the user opens the app, the user will be greeted with a screen depicting the app's logo and slogan.\nThe user will not need to do anything during this time and should be taken to the next page after ~3 seconds."
        , "The user will be asked to sign in before using the app. They will have 4 options: Sign In, Register, Register with Google, and Register with LinkedIn."
        , "The user will be asked to enter their existing username and password."
        , "The user will be asked to enter their desired username and a qualifying password."
        , "This is the main page where the user will interact with the T'ena Sensor.\nHere the user shall connect to the sensor, calibrate the sensor, and perform exercises.\nThe app will also display whether or not a T'ena Sensor is currently connected to the app."
        , "The user shall select which Bluetooth device they wish to connect to. Both the device's name and its MAC address will be displayed."
        , "Before performing any exercises with the sensor, the user should first calibrate the sensor to eliminate any inertial drift that the sensor may be exhibiting. While this step is optional, failing to calibrate the sensor may reduce the accuracy of collected data caused by an offset in IMU values.\nThe user will be required to keep the sensor still for a few seconds; First while the sensor is flat, then while it is on its side."
        , "The user will be presented with a set of exercises they shall perform. The exercises can be completed in any order.\nThe exercises that must be completed are Block Placing, Finger To Nose, Cup Drinking, and Rod Placing."
        , "The user will need to perform 5 trials for the exercise they selected in the Sensor Exercises page.\nFirst, the user will be required to keep their hand steady for 3 seconds before they will perform the exercise.\nAfter the timer is complete, the user can perform the exercise as described in the instructions. When the exercise is complete, the user shall select Stop Data Collection to end the trial.\nThe app will display the progress that the user has made with the current exercise. The user can either select Next Trial to repeat the exercise for another trial or they can return to the Exercise Selection page by selecting Exit Exercise."];
    // An index to track the contender image 
    let imageIndex = 1;
    var bannerImage;


    return (
        <>
            <header>
                <div className="content">
                    <a href="/" className="logo"><img src="/Images/Home-Icon.png" height="20" /></a>
                    <nav className="desktop">
                        <a href="#Validation">Validation</a>
                        <a href="#Design">Design</a>
                    </nav>
                    <nav className="mobile">
                        <a href="#Validation">Validation</a>
                        <a href="#Design">Design</a>
                    </nav>
                </div>
            </header>

            <div className="main-content">
                <div id="projects-section">
                    <div className="content center">
                        <h1>T'ena Sensor Projects</h1>
                    </div>
                    <div id="Validation" className="project">
                        <h2>Accuracy and Validity of a Single Inertial Measurement Unit-based System to Determine Upper Limb Kinematics
                            for Medically Underserved Populations</h2>
                        <div className="images-container">
                            <div className="image-container">
                                <p>Stroke is one of the leading causes of death and disability worldwide, with a
                                    disproportionate burden represented by low- and middle-income countries (LMICs). To
                                    improve post-stroke outcomes in LMICs, researchers have sought to leverage emerging
                                    technologies that overcome traditional barriers associated with stroke management. One
                                    such technology, inertial measurement units (IMUs), exhibit great potential as a low-cost,
                                    portable means to evaluate and monitor patient progress during decentralized
                                    rehabilitation protocols. As such, the aim of the present study was to determine the
                                    ability of a low-cost single IMU sensor-based wearable system (named the T'ena sensor) to
                                    reliably and accurately assess movement quality and efficiency in physically and
                                    neurologically healthy adults. Upper limb movement kinematics measured by the T'ena
                                    sensor were compared to the gold standard reference system during three functional
                                    tasks, and root mean square errors, Pearson's correlation coefficients, intraclass
                                    correlation coefficients, and the Bland Altman method were used to compare
                                    kinematic variables of interest between the two systems for absolute accuracy and
                                    equivalency. The T'ena sensor and the gold standard reference system were
                                    significantly correlated for all tasks and measures (r range = 0.648—0.947), although
                                    less so for the Finger to Nose task (r range = 0.648—0.894). Results demonstrate that
                                    single IMU systems are a valid, reliable, and objective method by which to measure
                                    movement kinematics during functional tasks. Context-appropriate enabling technologies
                                    specifically designed to address barriers to quality health services in LMICs can accelerate
                                    progress towards the United Nations Sustainable Development Goal 3.</p>
                            </div>
                        </div>
                        <div className="doc-container">
                            <object
                                data="/Documents/Research/Accuracy and Validity of a Single Inertial Measurement Unit-based System to Determine Upper Limb Kinematics for Medically Underserved Populations.pdf"
                                type="application/pdf" frameBorder="0" width="100%" height="600px">
                                <embed src="https://drive.google.com/file/d/1r5fF8vHXmd9n3IrxtS07IUyOgje2zWxG/preview?usp=sharing"
                                    width="100%" height="600px" />
                            </object>
                        </div>
                    </div>
                    <div id="Design" className="project">
                        <h2>Design and Evaluation of an IMU Sensor-based System for the Rehabilitation of Upper Limb Motor Dysfunction
                        </h2>
                        <div className="images-container">
                            <div className="image-container">
                                <p>Stroke is one of the most significant noncommunicable diseases in the world with approximately 15
                                    million people experiencing a new or recurrent stroke each
                                    year. Nearly half of stroke survivors have some degree
                                    of permanent sensorimotor impairment and require specialized
                                    rehabilitation. Wearable technologies are a cost-effective means
                                    by which to monitor and provide feedback about sensorimotor
                                    function across the different phases of stroke recovery, with
                                    insights improving decision-making by rehabilitation clinicians
                                    and increasing accountability and motivation for the patient. In
                                    this paper, we design and evaluate a wearable sensor system that
                                    measures movement kinematics during the performance of
                                    activities of daily living. Results indicate high to very high
                                    agreement and correlation values between the sensor and the
                                    gold-standard motion capture system, regardless of kinematic
                                    parameter. In sum, the described sensor is capable of accurately
                                    measuring upper limb movement kinematics, using only a single
                                    sensor. The adoption of portable and low-cost devices have the
                                    ability to make a substantial impact for the millions of persons
                                    who exhibit motor impairments after a stroke.</p>
                            </div>
                        </div>
                        <div className="doc-container">
                            <object
                                data="/Documents/Research/Design and Evaluation of an IMU Sensor-based System for the Rehabilitation of Upper Limb Motor Dysfunction.pdf"
                                type="application/pdf" frameBorder="0" width="100%" height="600px">
                                <embed src="https://drive.google.com/file/d/16BwV6nx6hPrzn0U1XlZGfKsn7M-9K-vs/preview?usp=sharing"
                                    width="100%" height="600px" />
                            </object>
                        </div>
                    </div>
                </div>

            </div>
        </>
    )
}

async function handleClick(e) {
    e.preventDefault()
    if (imageIndex === (picPaths.length - 1)) {
        imageIndex = 0;
    }
    else {
        imageIndex = imageIndex + 1;
    }
}

export default TenaSensor