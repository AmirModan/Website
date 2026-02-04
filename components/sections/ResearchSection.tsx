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
    <section className="py-20 relative">
      {/* Background decoration */}
      <div className="absolute inset-0 bg-gradient-to-b from-accent-900/10 via-transparent to-primary-900/10" />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        {/* Section Header */}
        <div className="text-center mb-16">
          <h2 className="text-4xl md:text-5xl font-bold mb-6">
            <span className="gradient-text">{title}</span>
          </h2>
          <p className="text-xl text-gray-400 max-w-3xl mx-auto leading-relaxed">
            {subtitle}
          </p>
        </div>

        {/* Research Items */}
        <div className="space-y-12">
          {researchItems.map((item, index) => (
            <div
              key={item.title}
              className={`flex flex-col ${
                index % 2 === 1 ? 'lg:flex-row-reverse' : 'lg:flex-row'
              } gap-8 items-center`}
            >
              <div className="flex-1">
                <Card className="h-full">
                  <div className="aspect-video mb-4 overflow-hidden rounded-xl">
                    <img
                      src={item.image}
                      alt={item.title}
                      className="w-full h-full object-cover transition-transform duration-300 hover:scale-110"
                    />
                  </div>
                </Card>
              </div>

              <div className="flex-1 text-center lg:text-left">
                <h3 className="text-3xl font-bold text-white mb-4">
                  {item.title}
                </h3>
                <p className="text-lg text-gray-300 mb-6 leading-relaxed">
                  {item.description}
                </p>
                {item.technologies && item.technologies.length > 0 && (
                  <div className="flex flex-wrap gap-2 mb-6 justify-center lg:justify-start">
                    {item.technologies.map((tech, techIndex) => (
                      <span
                        key={techIndex}
                        className="px-3 py-1 bg-accent-500/20 text-accent-300 rounded-full text-sm font-medium"
                      >
                        {tech}
                      </span>
                    ))}
                  </div>
                )}
                {item.href && (
                  <button
                    onClick={() => window.open(item.href, '_blank')}
                    className="text-accent-400 hover:text-accent-300 font-medium flex items-center gap-1 group mx-auto lg:mx-0"
                  >
                    Learn more
                    <svg
                      className="w-4 h-4 transition-transform group-hover:translate-x-1"
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
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};
