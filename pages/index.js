import Head from 'next/head'
import { useRouter } from 'next/router'
import Button from '../public/components/Button'
import React from 'react'

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
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </Head>
      <header>
        <div className="content">
          <a href="#aboutMe-section" class="logo"><img src="/Images/Home-Icon.png" height="20" /></a>
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
              <button onClick={(e) => { goToPage(e, '/contact') }}>Contact Me</button>
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
            <div class="image-container" onClick={(e) => { goToPage(e, '/Research/MyoHMI') }}>{<Button title="MyoHMI" url="/Images/MyoHMI.png" />}</div>
            <div class="text-container">
              <p>MyoHMI is an Android-based Neural-Machine Interface capable of recognizing a
                user's physical intent from surface EMG signals, useful for medical applications such as Stroke
                Rehabilitation and Amputees.</p>
            </div>
          </div>
          <div class="images-container">
            <div class="image-container" onClick={(e) => { goToPage(e, '/Research/TenaSensor') }}>{<Button title="T'ena Sensor App" url="/Images/TenaSensor.png" />}</div>
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
            <div class="image-container" onClick={(e) => { goToPage(e, '/Projects/CNNGestureRecognition') }}>{<Button title="Gesture Recognition" url="/Images/Armband.jpg" />}</div>
            <div class="text-container">
              <p>Using a Convolutional Neural Network, we can predict a user's muscular intent based on Electromyography
                signals.</p>
            </div>
          </div>
          <div class="images-container">
            <div class="image-container" onClick={(e) => { goToPage(e, '/Projects/ARM') }}>{<Button title="ARM Cortex Projects" url="/Images/TM4C.jpg" />}</div>
            <div class="text-container">
              <p>From Texas Instruments, the TM4C123 Microcontroller allows programmers to become comfortable with the ARM
                Architecture.</p>
            </div>
          </div>
          <div class="images-container">
            <div class="image-container" onClick={(e) => { goToPage(e, '/Projects/RaspberryPi') }}>{<Button title="Raspberry Pi Projects" url="/Images/RaspberryPi.jpg" />}</div>
            <div class="text-container">
              <p>Using a wide variety of components, I apply my knowledge of electric circuits as well as C to building
                various projects using my Raspberry Pi, challenging myself to go beyond the instruction manual.</p>
            </div>
          </div>
          <div class="images-container">
            <div class="image-container">
              <a href="./Projects/Game">{<Button url="/Images/GamePicture.png" />}</a>
              <h3>Game</h3>
            </div>
            <div class="text-container">
              <p>A humble attempt at developing a 2D Platformer, I built this game as a fun way to further my knowledge and
                confidence in JavaScript using the game development framework known as Phaser.js.</p>
            </div>
          </div>
          <div class="images-container">
            <div class="image-container" onClick={(e) => { goToPage(e, '/Projects/Tic-Tac-Toe_React') }}>{<Button title="Tic-Tac-Toe" url="/Images/Tic-Tac-Toe.png" />}</div>
            <div class="text-container">
              <p>A game of Tic-Tac-Toe built while I was learning to use React. Each piece of the game, such as the board and individual squares, are represented by their own component with their own attributes. Furthermore, the components are also capable of tracking their own state, allowing us to "time travel" to any move made previously.</p>
            </div>
          </div>
          <div class="images-container">
            <div class="image-container" onClick={(e) => { goToPage(e, '/Projects/FPGA') }}>{<Button title="FPGA Projects" url="/Images/FPGA.jpg" />}</div>
            <div class="text-container">
              <p>The Cyclone V Field-Programmable Gate Array (FPGA) from Intel allows us to easily emulate hardware designs
                without having to go through the lengthy fabrication process required by an ASIC Chip.</p>
            </div>
          </div>
          <div class="images-container">
            <div class="image-container" onClick={(e) => { goToPage(e, '/Projects/IC') }}>{<Button title="IC Projects" url="/Images/IC.jpg" />}</div>
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