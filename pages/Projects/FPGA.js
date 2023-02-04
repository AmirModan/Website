import Head from 'next/head'
import Header from '../../public/components/Header'

function FPGA() {

    return (
        <>
            <Head>
                <title>FPGA</title>
                <meta name="viewport" />
            </Head>

            <Header header1="Motion Estimator"/>
            <header>
                <div class="content">
                    <a href="/" class="logo"><img src="/Images/Home-Icon.png" height="20" /></a>
                    <nav class="desktop">
                        <a href="#Motion Estimator">Motion Estimator</a>
                    </nav>
                    <nav class="mobile">
                        <a href="#Motion Estimator">Motion Estimator</a>
                    </nav>
                </div>
            </header>

            <div class="main-content">
                <div id="projects-section">
                    <div class="content center">
                        <h1>FPGA Projects</h1>
                    </div>
                    <div id="Motion Estimator" class="project">
                        <h2>Motion Estimator</h2>
                        <div class="images-container">
                            <div class="image-container">
                                <img src="/Images/FPGA-Ex.jpg" />
                            </div>
                            <div class="image-container">
                                <img src="/Images/FPGA-WAV.jpg" />
                            </div>
                            <div class="image-container">
                                <img src="/Images/FPGA-Graph.jpg" />

                            </div>
                        </div>
                        <div class="images-container">
                            <div class="image-container">
                                <p>Before initiating the physical design process of our Motion Estimator ASIC, we will first emulate the Verilog Code we
                                    wrote on an FPGA as FPGA's can easily be reprogrammed as opposed to an ASIC which we would have to dispose of and remanufacture.
                                    This will drastically reduce the consequences should there be an error in our design.</p>
                            </div>
                        </div>
                        <div class="center">
                            <h3>Click <a href="./IC">here</a> to go to ASIC Implementation of Motion Estimator</h3>
                            <div class="images-container">
                                <div class="image-container">
                                </div>
                                <div class="image-container">
                                    <h3>Motion Estimator FPGA Design Files</h3>
                                    <p><a href="/src/FPGA/Motion_Estimator/MotionEstimator.v">MotionEstimator.v</a></p>
                                    <p><a href="/src/FPGA/Motion_Estimator/pin_ip.v">pin_ip.v</a></p>
                                    <p><a href="/src/FPGA/Motion_Estimator/top.v">top.v</a></p>
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

export default FPGA