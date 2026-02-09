import React from 'react';
import { Card } from '../ui/Card';

interface ResearchItem {
  title: string;
  description: string;
  image: string;
  technologies?: string[];
  href?: string;
}

interface ResearchSectionProps {
  researchItems: ResearchItem[];
  title?: string;
  subtitle?: string;
}

export const ResearchSection: React.FC<ResearchSectionProps> = ({
  researchItems,
  title = 'My Research',
  subtitle = 'Advancing technology through academic research and innovation',
}) => {
  return (
    <section id="research-section" className="py-8 sm:py-12 relative">
      {/* Background decoration */}
      <div className="absolute inset-0 bg-gradient-to-b from-accent-900/10 via-transparent to-primary-900/10" />

      <div className="section-container relative z-10">
        {/* Section Header */}
        <div className="text-center mb-12 sm:mb-16">
          <h2 className="text-2xl sm:text-3xl md:text-4xl font-bold mb-3 sm:mb-4">
            <span className="gradient-text">{title}</span>
          </h2>
          <p className="text-lg sm:text-xl text-gray-400 max-w-3xl mx-auto leading-relaxed px-4 sm:px-0">
            {subtitle}
          </p>
        </div>

        {/* Research Items */}
        <div
          className="space-y-12 sm:space-y-16 lg:space-y-20"
          style={{ width: '100%', maxWidth: '1200px', margin: '0 auto' }}
        >
          {researchItems.map((item, index) => (
            <div
              key={item.title}
              className="transform transition-all duration-300 hover:-translate-y-2 w-full"
              onClick={() => item.href && window.open(item.href, '_blank')}
              style={{ width: '100%', margin: '1rem 0' }}
            >
              <Card className="overflow-hidden h-full research-card">
                <div className="w-full py-4 px-4 overflow-hidden rounded-xl bg-white/5">
                  <div className="w-full aspect-[3/2] max-h-32 overflow-hidden rounded">
                    <img
                      src={item.image}
                      alt={item.title}
                      className="w-full h-full object-contain transition-transform duration-300 hover:scale-110"
                    />
                  </div>
                </div>

                <h3 className="text-xl sm:text-2xl font-bold text-white mb-3 text-center">
                  {item.title}
                </h3>

                <p className="text-sm sm:text-base text-gray-300 mb-4 line-clamp-3 leading-relaxed text-center px-4">
                  {item.description}
                </p>

                {item.technologies && item.technologies.length > 0 && (
                  <div
                    className="flex flex-wrap gap-3 sm:gap-4 mb-4 justify-center"
                    style={{ gap: '1rem' }}
                  >
                    {item.technologies.map((tech, techIndex) => (
                      <span
                        key={techIndex}
                        className="px-3 py-1.5 bg-accent-500/30 text-accent-200 rounded-full text-xs sm:text-sm font-medium border border-accent-500/50"
                        style={{ padding: '0.375rem 0.75rem' }}
                      >
                        {tech}
                      </span>
                    ))}
                  </div>
                )}

                {item.href && (
                  <button className="text-accent-400 hover:text-accent-300 font-medium flex items-center gap-1 group mx-auto text-sm sm:text-base mb-4">
                    Learn more
                    <svg
                      className="w-3 h-3 sm:w-4 sm:h-4 transition-transform group-hover:translate-x-1"
                      fill="none"
                      stroke="currentColor"
                      viewBox="0 0 24 24"
                    >
                      <path
                        strokeLinecap="round"
                        strokeLinejoin="round"
                        strokeWidth={2}
                        d="M9 5l7 7-7 7"
                      />
                    </svg>
                  </button>
                )}
              </Card>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};
