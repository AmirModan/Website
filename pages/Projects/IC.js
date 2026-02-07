import Head from 'next/head';
import CommentBox from '../../public/components/CommentBox';

function IC() {
  return (
    <>
      <Head>
        <title>IC</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </Head>

      <div className="min-h-screen bg-gradient-to-br from-slate-900 via-indigo-900 to-slate-900">
        <div className="container mx-auto px-4 py-8">
          <div className="text-center mb-12">
            <h1 className="text-5xl font-bold text-white mb-4 bg-clip-text text-transparent bg-gradient-to-r from-indigo-400 to-purple-600">
              IC Projects
            </h1>
            <div className="w-32 h-1 bg-gradient-to-r from-indigo-400 to-purple-600 mx-auto"></div>
          </div>

          <div className="space-y-16">
            {/* Motion Estimator */}
            <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 shadow-2xl border border-white/20 hover:shadow-indigo-500/20 transition-all duration-300">
              <h2 className="text-3xl font-bold text-white mb-8 text-center">
                Motion Estimator ASIC
              </h2>

              <div className="bg-white/5 backdrop-blur rounded-2xl p-6 border border-white/10 mb-8">
                <div className="text-gray-100 space-y-4">
                  <p className="leading-relaxed">
                    While an FPGA offers reprogrammability, hardware dedicated
                    for a specific application will generally boast better
                    performance. Such a performance boost will be desired for an
                    application such as Motion Estimation which aims to reduce
                    video size through compression.
                  </p>
                  <p className="leading-relaxed">
                    We will port our already verified FPGA implementation of the
                    Motion Estimator so that we can assemble an ASIC with the
                    same purpose. Designing the Layout of an IC will require us
                    to implement the Motion Estimator at the Transistor Level.
                    Because we have implemented the Motion Estimator at the
                    Register Transfer Level (RTL), we will use Synopsys software
                    to synthesize the code into its Transistor Representation.
                    This will be significantly easier than trying to implement
                    the Motion Estimator at the Transistor level directly.
                  </p>
                  <p className="leading-relaxed">
                    Click{' '}
                    <a
                      href="./FPGA"
                      className="text-indigo-400 hover:text-indigo-300 underline transition-colors"
                    >
                      here
                    </a>{' '}
                    to go to FPGA Implementation of Motion Estimator
                  </p>
                </div>
              </div>

              <div className="mb-8">
                <div className="bg-white/5 backdrop-blur rounded-2xl overflow-hidden border border-white/10">
                  <object
                    data="/src/IC/Motion_Estimator/MotionEstimator_Report.pdf"
                    type="application/pdf"
                    className="w-full h-[600px] rounded-2xl"
                  >
                    <embed
                      src="https://drive.google.com/file/d/10jEHWLgAayeNXRdChEwGx1ToMVFItoNh/preview?usp=sharing"
                      className="w-full h-[600px]"
                    />
                  </object>
                </div>
              </div>

              <div className="grid md:grid-cols-3 gap-6">
                <div className="bg-gradient-to-br from-indigo-500/20 to-purple-500/20 backdrop-blur rounded-2xl p-6 border border-white/10">
                  <h3 className="text-xl font-bold text-white mb-4">
                    Design Files
                  </h3>
                  <div className="space-y-2">
                    {[
                      {
                        name: 'rtl.v',
                        path: '/src/IC/Motion_Estimator/RTL Code/rtl.v',
                      },
                      {
                        name: 'Netlist',
                        path: '/src/IC/Motion_Estimator/Synthesis/output/gc_HDL.v',
                      },
                      {
                        name: 'Netlist with Parasitics',
                        path: '/src/IC/Motion_Estimator/PhysicalDesign/output/Project_extracted.v',
                      },
                    ].map((file) => (
                      <a
                        key={file.name}
                        href={file.path}
                        className="block text-indigo-300 hover:text-indigo-400 hover:bg-white/10 px-3 py-2 rounded-lg transition-all duration-200"
                      >
                        {file.name}
                      </a>
                    ))}
                  </div>
                </div>

                <div className="bg-gradient-to-br from-purple-500/20 to-pink-500/20 backdrop-blur rounded-2xl p-6 border border-white/10">
                  <h3 className="text-xl font-bold text-white mb-4">Scripts</h3>
                  <div className="space-y-2">
                    {[
                      {
                        name: 'Synthesis',
                        path: '/src/IC/Motion_Estimator/Synthesis/dc_synth.tcl',
                      },
                      {
                        name: 'Pre-Layout',
                        path: '/src/IC/Motion_Estimator/Pre-LayoutTimingAnalysis/pre_layout_pt.tcl',
                      },
                      {
                        name: 'Layout',
                        path: '/src/IC/Motion_Estimator/PhysicalDesign/physical_design_icc.tcl',
                      },
                      {
                        name: 'Post-Layout',
                        path: '/src/IC/Motion_Estimator/Post-LayoutTimingAnalysis/post_layout_pt.tcl',
                      },
                    ].map((file) => (
                      <a
                        key={file.name}
                        href={file.path}
                        className="block text-purple-300 hover:text-purple-400 hover:bg-white/10 px-3 py-2 rounded-lg transition-all duration-200"
                      >
                        {file.name}
                      </a>
                    ))}
                  </div>
                </div>

                <div className="bg-gradient-to-br from-pink-500/20 to-red-500/20 backdrop-blur rounded-2xl p-6 border border-white/10">
                  <h3 className="text-xl font-bold text-white mb-4">Reports</h3>
                  <div className="space-y-2">
                    {[
                      {
                        name: 'Timing',
                        path: '/src/IC/Motion_Estimator/Post-LayoutTimingAnalysis/reports/timing.rpt',
                      },
                      {
                        name: 'Power',
                        path: '/src/IC/Motion_Estimator/PhysicalDesign/reports/Project_power.rpt',
                      },
                      {
                        name: 'Area',
                        path: '/src/IC/Motion_Estimator/PhysicalDesign/reports/Project_route_util.rpt',
                      },
                    ].map((file) => (
                      <a
                        key={file.name}
                        href={file.path}
                        className="block text-pink-300 hover:text-pink-400 hover:bg-white/10 px-3 py-2 rounded-lg transition-all duration-200"
                      >
                        {file.name}
                      </a>
                    ))}
                  </div>
                </div>
              </div>
            </div>

            {/* SRAM */}
            <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 shadow-2xl border border-white/20 hover:shadow-blue-500/20 transition-all duration-300">
              <h2 className="text-3xl font-bold text-white mb-8 text-center">
                32x16 SRAM Design
              </h2>

              <div className="bg-white/5 backdrop-blur rounded-2xl p-6 border border-white/10 mb-8">
                <div className="text-gray-100 space-y-4">
                  <p className="leading-relaxed">
                    Using 90nm VLSI Technology, we have designed this 32x16 SRAM
                    using Synopsys Custom Compiler. Due to its static nature,
                    achieved through inverter feedback within the SRAM Cell, the
                    SRAM will perform at a higher rate than DRAM, though it will
                    take more space.
                  </p>
                  <p className="leading-relaxed">
                    All components, including the: SRAM Array, Decoder, Sense
                    Amplifier, Write Driver, and Pre-Charge Circuits have been
                    designed at the transistor level.
                  </p>
                </div>
              </div>

              <div className="grid lg:grid-cols-2 gap-8 mb-8">
                <div className="bg-white/5 backdrop-blur rounded-2xl overflow-hidden border border-white/10">
                  <object
                    data="/src/IC/SRAM/ENGR848_SRAM_Modan_Apte.pdf"
                    type="application/pdf"
                    className="w-full h-[600px] rounded-2xl"
                  >
                    <embed
                      src="https://drive.google.com/file/d/1TYNUO_HmEJ3H92P_0mU3gYhHs3PWXg4f/preview?usp=sharing"
                      className="w-full h-[600px]"
                    />
                  </object>
                </div>

                <div className="bg-white/5 backdrop-blur rounded-2xl overflow-hidden border border-white/10">
                  <iframe
                    src="https://drive.google.com/embeddedfolderview?id=1Yhromjic5CvSZ7814xI9j9t51DLUtyr7#grid"
                    className="w-full h-[600px] rounded-2xl border-0"
                  ></iframe>
                </div>
              </div>

              <div className="text-center">
                <CommentBox pageName="SRAM" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default IC;
