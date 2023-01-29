import Head from 'next/head'
import { useRouter } from 'next/router'

function Home() {

  const router = useRouter()

  const goToPage = (e, path) => {
    e.preventDefault()
    router.push(path)
  };

  return (
    <>
      <Head>
        <title>Amir Modan</title>
        <meta name="viewport" />
      </Head>
      <header>
        <div className="content">
          <a href="#aboutMe-section" class="logo"><img src="/Images/Home-Icon.png" height="20" /></a>
          <a href="#aboutMe-section" className="logo"></a>
          <nav className="desktop">
            <a href="#aboutMe-section">About Me</a>
            <a href="#research-section">My Research</a>
            <a href="#projects-section">My Projects</a>
            <a href="#resume-section">My Resume</a>
          </nav>
          <nav className="mobile">
            <a href="#aboutMe-section">About Me</a>
            <a href="#research-section">My Research</a>
            <a href="#projects-section">My Projects</a>
            <a href="#resume-section">My Resume</a>
          </nav>
        </div>
      </header>
      <div class="main-content">
        <div id="aboutMe-section">
          <div class="content center">
            <h1>About Me</h1>
            <h2>Amir Modan</h2>
          </div>
          <div class="images-container">
            <div class="image-container">
              <img src="/Images/Profile.jpg" />
            </div>
            <div class="text-container">
              <p>Hey, my name is Amir, and I am a Computer Engineering graduate (M.S) from San Francisco State University.
                In my spare time, I like to learn new programming languages/concepts, then implement them in various projects.
                I also like to tinker with my Raspberry Pi, exercise at the gym, play pool, and "cube" with my Rubik's Cube.
              </p>
              <a href="https://github.com/AmirModan"><img src="/Images/GitHub-logo.png" height="50" /></a>
              <br></br><br></br>
              <a href="https://www.linkedin.com/in/amir-modan-8320b0194"><img src="/Images/LinkedIn-Logo.jpg"
                height="50" /></a>
              <br></br><br></br>
              <button onClick={(e) => {goToPage(e, '/contact')}}>Contact Me</button>
            </div>
          </div>
          <div class="images-container">
          </div>
        </div>
        <div id="research-section" class="section">
          <div class="content center">
            <h1>My Research</h1>
          </div>
          <div class="images-container">
            <div class="image-container">
              <a href="./Research/MyoHMI"><img src="/Images/MyoHMI.png" /></a>
              <h3>MyoHMI</h3>
            </div>
            <div class="text-container">
              <p>MyoHMI is an Android-based Neural-Machine Interface capable of recognizing a
                user's physical intent from surface EMG signals, useful for medical applications such as Stroke
                Rehabilitation and Amputees.</p>
            </div>
          </div>
          <div class="images-container">
            <div class="image-container">
              <a href="./Research/TenaSensor"><img src="/Images/TenaSensor.png" /></a>
              <h3>T'ena Sensor App</h3>
            </div>
            <div class="text-container">
              <p>The T'ena Sensor app allows users to record and view IMU data received from the sensor after performing sets
                of exercises.</p>
            </div>
          </div>
        </div>

        <div id="projects-section" class="section">
          <div class="content center">
            <h1>My Projects</h1>
          </div>
          <div class="images-container">
            <div class="image-container">
              <a href="./Projects/CNNGestureRecognition"><img src="/Images/Armband.jpg" /></a>
              <h3>Gesture Recognition</h3>
            </div>
            <div class="text-container">
              <p>Using a Convolutional Neural Network, we can predict a user's muscular intent based on Electromyography
                signals.</p>
            </div>
          </div>
          <div class="images-container">
            <div class="image-container">
              <a href="./Projects/ARM"><img src="/Images/TM4C.jpg" /></a>
              <h3>ARM Cortex Projects</h3>
            </div>
            <div class="text-container">
              <p>From Texas Instruments, the TM4C123 Microcontroller allows programmers to become comfortable with the ARM
                Architecture.</p>
            </div>
          </div>
          <div class="images-container">
            <div class="image-container">
              <a href="./Projects/RaspberryPi"><img src="/Images/RaspberryPi.jpg" /></a>
              <h3>Raspberry Pi Projects</h3>
            </div>
            <div class="text-container">
              <p>Using a wide variety of components, I apply my knowledge of electric circuits as well as C to building
                various projects using my Raspberry Pi, challenging myself to go beyond the instruction manual.</p>
            </div>
          </div>
          <div class="images-container">
            <div class="image-container">
              <a href="./Projects/Game"><img src="/Images/GamePicture.png" /></a>
              <h3>Game</h3>
            </div>
            <div class="text-container">
              <p>A humble attempt at developing a 2D Platformer, I built this game as a fun way to further my knowledge and
                confidence in JavaScript using the game development framework known as Phaser.js.</p>
            </div>
          </div>
          <div class="images-container">
            <div class="image-container">
              <a href="./Projects/FPGA"><img src="/Images/FPGA.jpg" /></a>
              <h3>FPGA Projects</h3>
            </div>
            <div class="text-container">
              <p>The Cyclone V Field-Programmable Gate Array (FPGA) from Intel allows us to easily emulate hardware designs
                without having to go through the lengthy fabrication process required by an ASIC Chip.</p>
            </div>
          </div>
          <div class="images-container">
            <div class="image-container">
              <a href="./Projects/IC"><img src="/Images/IC.jpg" /></a>
              <h3>IC Projects</h3>
            </div>
            <div class="text-container">
              <p>Though they are not reprogrammable, Integrated Circuits are ideal for achieving optimal speed and power
                consumption due to their dedicated hardware.</p>
            </div>
          </div>
        </div>

        <div id="resume-section" class="section">
          <div class="content center">
            <h1>My Resume</h1>
          </div>
          <div class="images-container">
            <object data="/Documents/Resume.pdf" type="application/pdf" frameborder="0" width="100%" height="600px">
              <embed src="https://drive.google.com/file/d/1HBpCghRHuGDHIoxWbIUfzUKGuvrbDd8R/preview?usp=sharing" width="100%"
                height="600px" />
            </object>
          </div>
        </div>

      </div>
    </>
  )
}

export default Home