import React from "react";
import Head from 'next/head'
import Header from '../../public/components/Header'
import Slideshow from '../../public/components/Slideshow'
import CommentBox from '../../public/components/CommentBox'

function TenaSensor() {

    return (
        <>
            <Head>
                <title>T'ena Sensor</title>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
            </Head>

            <Header header1="Validation" header2="Design" header3="App" />

            <div className="main-content">
                <div id="projects-section">
                    <div className="content center">
                        <h1>T'ena Sensor Projects</h1>
                    </div>
                    <div id="App" class="project">
                        <h2>App</h2>
                        <Slideshow />
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
                        <div className="textbox-container">
                            <CommentBox pageName="Tena Sensor" />
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