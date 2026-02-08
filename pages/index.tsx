import Head from 'next/head';
import { useRouter } from 'next/router';
import React, { MouseEvent } from 'react';
import { Navigation } from '../components/ui/Navigation';
import { HeroSection } from '../components/sections/HeroSection';
import { ResearchSection } from '../components/sections/ResearchSection';
import { ProjectsSection } from '../components/sections/ProjectsSection';
import { Card } from '../components/ui/Card';
import { Button } from '../components/ui/Button';

function Home() {
  const router = useRouter();

  const goToPage = (e: MouseEvent, path: string) => {
    e.preventDefault();
    router.push(path);
  };

  const researchItems = [
    {
      title: 'MyoHMI',
      description:
        "MyoHMI is an Android-based Neural-Machine Interface capable of recognizing a user's physical intent from surface EMG signals, useful for medical applications such as Stroke Rehabilitation and Amputees.",
      image: '/Images/MyoHMI.png',
      technologies: [
        'Android',
        'Machine Learning',
        'EMG Signals',
        'Medical Applications',
      ],
      href: '/Research/MyoHMI',
    },
    {
      title: "T'ena Sensor App",
      description:
        "The T'ena Sensor app allows users to record and view IMU data received from the sensor after performing sets of exercises.",
      image: '/Images/TenaSensor.png',
      technologies: [
        'Mobile App',
        'IMU Data',
        'Exercise Tracking',
        'Data Visualization',
      ],
      href: '/Research/TenaSensor',
    },
  ];

  const projects = [
    {
      title: 'Gesture Recognition',
      description:
        "Using a Convolutional Neural Network, we can predict a user's muscular intent based on Electromyography signals.",
      image: '/Images/Armband.jpg',
      technologies: ['CNN', 'Machine Learning', 'EMG', 'Python'],
      href: '/Projects/CNNGestureRecognition',
    },
    {
      title: 'ARM Cortex Projects',
      description:
        'From Texas Instruments, the TM4C123 Microcontroller allows programmers to become comfortable with the ARM Architecture.',
      image: '/Images/TM4C.jpg',
      technologies: ['ARM', 'Embedded Systems', 'C Programming', 'TM4C123'],
      href: '/Projects/ARM',
    },
    {
      title: 'Raspberry Pi Projects',
      description:
        'Using a wide variety of components, I apply my knowledge of electric circuits as well as C to building various projects using my Raspberry Pi.',
      image: '/Images/RaspberryPi.jpg',
      technologies: ['Raspberry Pi', 'Circuits', 'C Programming', 'IoT'],
      href: '/Projects/RaspberryPi',
    },
    {
      title: '2D Platformer Game',
      description:
        'A humble attempt at developing a 2D Platformer, built as a fun way to further knowledge and confidence in JavaScript using Phaser.js.',
      image: '/Images/GamePicture.png',
      technologies: [
        'JavaScript',
        'Phaser.js',
        'Game Development',
        '2D Graphics',
      ],
      href: '/Projects/Game',
    },
    {
      title: 'Tic-Tac-Toe',
      description:
        'A game of Tic-Tac-Toe built while learning React. Components track their own state, allowing us to "time travel" to any move made previously.',
      image: '/Images/Tic-Tac-Toe.png',
      technologies: [
        'React',
        'State Management',
        'Component Architecture',
        'TypeScript',
      ],
      href: '/Projects/Tic-Tac-Toe_React',
    },
    {
      title: 'FPGA Projects',
      description:
        'The Cyclone V Field-Programmable Gate Array (FPGA) from Intel allows us to easily emulate hardware designs without lengthy fabrication.',
      image: '/Images/FPGA.jpg',
      technologies: ['FPGA', 'Hardware Design', 'Verilog', 'Intel Cyclone V'],
      href: '/Projects/FPGA',
    },
  ];

  return (
    <>
      <Head>
        <title>Amir Modan - Computer Engineering Graduate</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta
          name="description"
          content="Amir Modan - Computer Engineering graduate specializing in machine learning, embedded systems, and full-stack development."
        />
        <meta
          name="keywords"
          content="Amir Modan, Computer Engineering, Machine Learning, Embedded Systems, Full-stack Development"
        />
      </Head>

      <Navigation />

      {/* Hero Section */}
      <section className="relative py-8 sm:py-12">
        <div className="section-container">
          <div className="text-center">
            <h1 className="text-3xl sm:text-4xl md:text-5xl font-bold mb-4 sm:mb-6">
              <span className="gradient-text">Hi, I'm Amir Modan</span>
            </h1>
          </div>
        </div>
      </section>

      {/* About Section */}
      <section id="aboutMe-section" className="py-8 sm:py-12">
        <div className="section-container">
          <div className="text-center mb-12 sm:mb-16">
            <h2 className="text-3xl sm:text-4xl md:text-5xl font-bold mb-4 sm:mb-6">
              <span className="gradient-text">About Me</span>
            </h2>
          </div>

          <div className="flex justify-center">
            <Card className="p-8 sm:p-12 max-w-5xl w-full">
              <div className="grid grid-cols-1 md:grid-cols-2 items-center gap-8">
                {/* Picture */}
                <div className="flex justify-center">
                  <div className="relative w-20 h-20 sm:w-24 sm:h-24 md:w-28 md:h-28 rounded-xl border-2 border-white/20 shadow-xl overflow-hidden">
                    <img
                      src="/Images/Profile.jpg"
                      alt="Amir Modan"
                      className="object-cover w-full h-full"
                    />
                  </div>
                </div>

                {/* My Journey Content */}
                <div className="text-center md:text-left">
                  <h3 className="text-2xl sm:text-3xl font-bold text-white mb-6">
                    My Journey
                  </h3>
                  <p className="text-gray-300 mb-8 leading-relaxed text-base sm:text-lg">
                    Hey, my name is Amir, and I am a Computer Engineering
                    graduate (M.S) from San Francisco State University. In my
                    spare time, I like to learn new programming
                    languages/concepts, then implement them in various projects.
                    I also like to tinker with my Raspberry Pi, exercise at the
                    gym, play pool, and "cube" with my Rubik's Cube.
                  </p>
                  <div className="flex flex-wrap gap-3 justify-center md:justify-start">
                    <Button
                      variant="primary"
                      onClick={() => router.push('/contact')}
                      className="min-w-[120px]"
                    >
                      Contact Me
                    </Button>
                    <a
                      href="https://github.com/AmirModan"
                      target="_blank"
                      rel="noopener noreferrer"
                      className="inline-flex items-center p-2 rounded-lg hover:bg-white/10 transition-all duration-300 transform hover:scale-110"
                    >
                      <img
                        src="/Images/GitHub-logo.png"
                        alt="GitHub"
                        style={{
                          width: '32px',
                          height: '32px',
                        }}
                      />
                    </a>
                    <a
                      href="https://www.linkedin.com/in/amir-modan-8320b0194"
                      target="_blank"
                      rel="noopener noreferrer"
                      className="inline-flex items-center p-2 rounded-lg hover:bg-white/10 transition-all duration-300 transform hover:scale-110"
                    >
                      <img
                        src="/Images/LinkedIn-Logo.jpg"
                        alt="LinkedIn"
                        style={{
                          width: '32px',
                          height: '32px',
                          borderRadius: '0.25rem',
                        }}
                      />
                    </a>
                  </div>
                </div>
              </div>
            </Card>
          </div>
        </div>
      </section>

      {/* Research Section */}
      <ResearchSection researchItems={researchItems} />

      {/* Projects Section */}
      <ProjectsSection projects={projects.slice(0, 6)} showAllButton={false} />

      {/* Resume Section */}
      <section id="resume-section" className="py-8 sm:py-12">
        <div className="section-container">
          <div className="text-center mb-12 sm:mb-16">
            <h2 className="text-3xl sm:text-4xl md:text-5xl font-bold mb-4 sm:mb-6">
              <span className="gradient-text">My Resume</span>
            </h2>
          </div>

          <div className="glass-morphism rounded-2xl p-6 sm:p-8 md:p-12">
            <div
              className="w-full max-w-6xl mx-auto"
              style={{ minHeight: '600px', height: '80vh' }}
            >
              <object
                data="/Documents/Resume.pdf"
                type="application/pdf"
                width="100%"
                height="100%"
                className="rounded-lg"
              >
                <embed
                  src="https://drive.google.com/file/d/1HBpCghRHuGDHIoxWbIUfzUKGuvrbDd8R/preview?usp=sharing"
                  width="100%"
                  height="100%"
                />
                <div className="text-center py-6 sm:py-8">
                  <p className="text-gray-400 mb-4 text-sm sm:text-base">
                    Unable to display PDF? View it directly:
                  </p>
                  <Button
                    variant="primary"
                    onClick={() =>
                      window.open(
                        'https://drive.google.com/file/d/1HBpCghRHuGDHIoxWbIUfzUKGuvrbDd8R/preview?usp=sharing',
                        '_blank'
                      )
                    }
                    className="min-w-[140px]"
                  >
                    Open Resume
                  </Button>
                </div>
              </object>
            </div>
          </div>
        </div>
      </section>
    </>
  );
}

export default Home;
