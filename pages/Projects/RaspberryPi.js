import Head from 'next/head'
import Header from '../../public/components/Header'

function RaspberryPi() {


    return (
        <>
            <Head>
                <title>Raspberry Pi</title>
                <meta name="viewport" />
            </Head>
            <Header/>

            <div class="main-content">
                <div id="projects-section">
                    <div class="content center">
                        <h1>Raspberry Pi Projects</h1>
                    </div>
                    <div class="project">
                        <div class="images-container">
                            <div class="image-container">
                                <h2>LED</h2>
                                <iframe width="360" height="315" src="https://www.youtube.com/embed/3KMFsbovLWM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                <p>This project was the result of me trying to create a light show using the Raspberry Pi.</p>
                                <p>A button is used to alternate between each of the 16 cases showed in the video.</p>
                                <p>The first 8 cases were created soley using loops to iterate which led was on at a given moment.</p>
                                <p>The second 8 cases were like the first 8, except that pulse width modulation (PWM) was used to brighten all led's to some degree, with the brightest being where the "pulse" was located.</p>
                                <p>The RGB light on the right has its own program where it uses PWM to cycle through the entire color spectrum.</p>
                                <h3><a href="src/RaspberryPi/3.c">Source Code for 8 LED's</a></h3>
                                <h3><a href="src/RaspberryPi/rgb.c">Source Code for RGB LED</a></h3>
                            </div>
                            <div class="image-container">
                                <h2>DC Motor</h2>
                                <iframe width="360" height="315" src="https://www.youtube.com/embed/quDkPa8eYJs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                <p>In this project, a fan is periodically spun in different directions using a DC Motor.
                                    This could not have been done without the use of the integrated circuit (IC) L293D.</p>
                                <h3><a href="src/RaspberryPi/motor.c">Source Code for DC Motor</a></h3>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </>
    )
}

export default RaspberryPi