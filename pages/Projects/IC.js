import Head from 'next/head'

function IC() {

    return (
        <>
            <Head>
                <title>IC</title>
                <meta name="viewport" />
            </Head>
            <header>
                <div class="content">
                    <a href="/" class="logo"><img src="/Images/Home-Icon.png" height="20" /></a>
                    <nav class="desktop">
                        <a href="#Motion Estimator">Motion Estimator</a>
                        <a href="#SRAM">SRAM</a>
                    </nav>
                    <nav class="mobile">
                        <a href="#Motion Estimator">Motion Estimator</a>
                        <a href="#SRAM">SRAM</a>
                    </nav>
                </div>
            </header>

            <div class="main-content">

                <div id="projects-section">
                    <div class="content center">
                        <h1>IC Projects</h1>
                    </div>
                    <div id="Motion Estimator" class="project">
                        <h2>Motion Estimator</h2>
                        <div class="images-container">
                            <div class="image-container">
                                <p>While an FPGA offers reprogrammability, hardware dedicated for a specific application will generally boast
                                    better performance.
                                    Such a performance boost will be desired for an application such as Motion Estimation which aims to reduce
                                    video size through compression.
                                    We will port our already verified FPGA implementation of the Motion Estimator so that we can assemble an
                                    ASIC with the same purpose.
                                    Designing the Layout of an IC will require us to implement the Motion Estimator at the Transistor Level.
                                    Because we have implemented the Motion Estimator at the Register Transfer Level (RTL), we will use Synopsys
                                    software to synthesize the code into its Transistor Representation.
                                    This will be significantly easier than trying to implement the Motion Estimator at the Transistor level
                                    directly.</p>
                                <p>Click <a href="./FPGA">here</a> to go to FPGA Implementation of Motion Estimator</p>
                            </div>
                        </div>
                        <div class="doc-container">
                            <object data="/src/IC/Motion_Estimator/MotionEstimator_Report.pdf" type="application/pdf"
                                frameborder="0" width="100%" height="600px">
                                <embed src="https://drive.google.com/file/d/10jEHWLgAayeNXRdChEwGx1ToMVFItoNh/preview?usp=sharing"
                                    width="100%" height="600px" />
                            </object>
                        </div>
                        <div class="images-container">
                            <div class="image-container">
                                <h3>Motion Estimator ASIC Design Files</h3>
                                <p><a href="/src/IC/Motion_Estimator/RTL Code/rtl.v">rtl.v</a></p>
                                <p><a href="/src/IC/Motion_Estimator/Synthesis/output/gc_HDL.v">Netlist</a></p>
                                <p><a href="/src/IC/Motion_Estimator/PhysicalDesign/output/Project_extracted.v">Netlist with Parasitics</a>
                                </p>
                            </div>
                            <div class="image-container">
                                <h3>Motion Estimator ASIC Scripts</h3>
                                <p><a href="/src/IC/Motion_Estimator/Synthesis/dc_synth.tcl">Synthesis</a></p>
                                <p><a href="/src/IC/Motion_Estimator/Pre-LayoutTimingAnalysis/pre_layout_pt.tcl">Pre-Layout</a></p>
                                <p><a href="/src/IC/Motion_Estimator/PhysicalDesign/physical_design_icc.tcl">Layout</a></p>
                                <p><a href="/src/IC/Motion_Estimator/Post-LayoutTimingAnalysis/post_layout_pt.tcl">Post-Layout</a></p>
                            </div>
                            <div class="image-container">
                                <h3>Motion Estimator ASIC Reports</h3>
                                <p><a href="/src/IC/Motion_Estimator/Post-LayoutTimingAnalysis/reports/timing.rpt">Timing</a></p>
                                <p><a href="/src/IC/Motion_Estimator/PhysicalDesign/reports/Project_power.rpt">Power</a></p>
                                <p><a href="/src/IC/Motion_Estimator/PhysicalDesign/reports/Project_route_util.rpt">Area</a></p>
                            </div>
                        </div>
                    </div>
                    <div id="SRAM" class="project">
                        <h2>SRAM</h2>
                        <div class="images-container">
                            <div class="image-container">
                                <p>Using 90nm VLSI Technology, we have designed this 32x16 SRAM using Synopsys Custom Compiler.
                                    Due to its static nature, achieved through inverter feedback within the SRAM Cell, the SRAM will perform at
                                    a higher rate than DRAM, though it will take more space.
                                    All components, including the: SRAM Array, Decoder, Sense Amplifier, Write Driver, and Pre-Charge Circuits
                                    have been designed at the transistor level.</p>
                                <iframe src="https://drive.google.com/embeddedfolderview?id=1Yhromjic5CvSZ7814xI9j9t51DLUtyr7#grid"
                                    width="100%" height="600px"></iframe>
                            </div>
                        </div>
                        <div class="doc-container">
                            <object data="../Projects/src/IC/SRAM/ENGR848_SRAM_Modan_Apte.pdf" type="application/pdf" frameborder="0"
                                width="100%" height="600px">
                                <embed src="https://drive.google.com/file/d/1TYNUO_HmEJ3H92P_0mU3gYhHs3PWXg4f/preview?usp=sharing"
                                    width="100%" height="600px" />
                            </object>
                        </div>
                    </div>
                </div>
            </div>
        </>
    )
}

export default IC