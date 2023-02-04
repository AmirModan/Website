import Head from 'next/head'
import Header from '../../public/components/Header'

function ARM() {

    return (
        <>
            <Head>
                <title>ARM</title>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
            </Head>

            <Header header1="Smart Home Security System" header2="Quake Detector"/>
            

            <div class="main-content">
                <div id="projects-section">
                    <div class="content center">
                        <h1>ARM Microcontroller Projects</h1>
                    </div>
                    <div id="Smart Home Security System" class="project">
                        <h2>Smart Home Security System</h2>
                        <div class="images-container">
                            <div class="image-container">
                                <iframe src="https://www.youtube.com/embed/4zdDbEcjosg" frameborder="1"
                                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                            <div class="text-container">
                                <p>When we were first tasked with implementing an Embedded System using the TM4C123 Microcontroller, we wanted
                                    to develop a low-cost, yet practical device that solves an issue common in many societies, Home Burglary.
                                </p>
                                <p>Because there are already several professional security systems on the market today with prices starting at
                                    over a hundred dollars, we wanted our security system to be extremely cost-effective so that anyone,
                                    especially poorer communities in which burglary is most rampant, can utilize our technology.</p>
                                <p>Therefore, we will use several low-cost, yet accurate peripherals that will help detect signs of burglary
                                    as
                                    well as preventing it, all being controlled by the Tiva Board.</p>
                                <p>The Tiva Board will also interface with a Raspberry Pi in order to add more advanced features to the
                                    Security
                                    System.</p>
                            </div>
                        </div>
                        <div class="doc-container">
                            <object
                                data="/src/TM4C/Security_System/SmartHomeSecuritySystem_Report.pdf"
                                type="application/pdf" frameborder="0" width="100%" height="600px">
                                <embed src="https://drive.google.com/file/d/1Xh2ga4TkpMtJ5WAThnlUK6OF-y9Nrgze/preview?usp=sharing"
                                    width="100%" height="600px" />
                            </object>
                        </div>
                        <div class="center">
                            <div class="images-container">
                                <div class="image-container">
                                    <h3>TM4C Source Code</h3>
                                    <p><a href="/src/TM4C/Security_System/Security_System.c">Security_System.c</a></p>
                                    <p><a href="/src/TM4C/Security_System/Accelerometer.c">Accelerometer.c</a></p>
                                    <p><a href="/src/TM4C/Security_System/Accelerometer.h">Accelerometer.h</a></p>
                                    <p><a href="/src/TM4C/Security_System/Encoder.c">Encoder.c</a></p>
                                    <p><a href="/src/TM4C/Security_System/Encoder.h">Encoder.h</a></p>
                                    <p><a href="/src/TM4C/Security_System/Button.c">Button.c</a></p>
                                    <p><a href="/src/TM4C/Security_System/Button.h">Button.h</a></p>
                                    <p><a href="/src/TM4C/Security_System/LCD.c">LCD.c</a></p>
                                    <p><a href="/src/TM4C/Security_System/LCD.h">LCD.h</a></p>
                                </div>
                                <div class="image-container">

                                </div>
                                <div class="image-container">
                                    <h3>Raspberry Pi Source Code</h3>
                                    <p><a href="/src/TM4C/Security_System/Server/CameraBreach.py">CameraBreach.py</a></p>
                                    <p><a href="/src/TM4C/Security_System/Server/TextServer.py">TextServer.py</a></p>
                                    <p><a href="/src/TM4C/Security_System/Server/ImageServer.py">ImageServer.py</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="Quake Detector" class="project">
                        <h2>Quake Detector</h2>
                        <div class="images-container">
                            <div class="image-container">
                                <iframe src="https://www.youtube.com/embed/Y5qcNP1vufc" frameborder="0"
                                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                            <div class="text-container">
                                <p>Throughout this project, we will design an Embedded System capable of detecting Seismic Activity using an
                                    Accelerometer. The system will display on an LCD screen how much Seismic Activity is currently being
                                    experienced and, if that amount were to surpass a set threshold, the system will classify this as a Quake
                                    and warn the user. An overheating prevention mechanism will also be implemented which will reduce power
                                    consumption of the system by sending the microcontroller into its Hibernation mode whenever the sampled
                                    internal temperature is past the safe threshold. Both the threshold for Seismic Activity and Temperature can
                                    be modified by the user via a Rotary Encoder.</p>
                            </div>
                        </div>
                        <div class="doc-container">
                            <object
                                data="/src/TM4C/Quake_Detector/QuakeDetector_Report.pdf"
                                type="application/pdf" frameborder="0" width="100%" height="600px">
                                <embed src="https://drive.google.com/file/d/13qnczD974Y4ZOMxJ7BV-gu0hkcbsXaXF/preview?usp=sharing"
                                    width="100%" height="600px" />
                            </object>
                        </div>
                        <div class="center">
                            <div class="images-container">
                                <div class="image-container">
                                </div>
                                <div class="image-container">
                                    <h3>TM4C Source Code</h3>
                                    <p><a href="/src/TM4C/Quake_Detector/Quake_Detector.c">Quake_Detector.c</a></p>
                                    <p><a href="/src/TM4C/Quake_Detector/Accelerometer.c">Accelerometer.c</a></p>
                                    <p><a href="/src/TM4C/Quake_Detector/Accelerometer.h">Accelerometer.h</a></p>
                                    <p><a href="/src/TM4C/Quake_Detector/Encoder.c">Encoder.c</a></p>
                                    <p><a href="/src/TM4C/Quake_Detector/Encoder.h">Encoder.h</a></p>
                                    <p><a href="/src/TM4C/Quake_Detector/Button.c">Button.c</a></p>
                                    <p><a href="/src/TM4C/Quake_Detector/Button.h">Button.h</a></p>
                                    <p><a href="/src/TM4C/Quake_Detector/LCD.c">LCD.c</a></p>
                                    <p><a href="/src/TM4C/Quake_Detector/LCD.h">LCD.h</a></p>
                                </div>
                                <div class="image-container">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </>
    )
}

export default ARM