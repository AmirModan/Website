import React from 'react';
import { ProjectCard } from '../ui/Card';
import { Button } from '../ui/Button';
import { ArrowRightIcon } from '@heroicons/react/24/outline';

interface Project {
  title: string;
  description: string;
  image: string;
  technologies?: string[];
  href?: string;
}

interface ProjectsSectionProps {
  projects: Project[];
  title?: string;
  subtitle?: string;
  showAllButton?: boolean;
  onProjectClick?: (project: Project) => void;
  onViewAllClick?: () => void;
}

export const ProjectsSection: React.FC<ProjectsSectionProps> = ({
  projects,
  title = 'My Projects',
  subtitle = 'Exploring technology through hands-on development and innovation',
  showAllButton = true,
  onProjectClick,
  onViewAllClick,
}) => {
  return (
    <section className="py-16 sm:py-20 relative overflow-hidden">
      {/* Background decoration */}
      <div className="absolute inset-0 bg-gradient-to-b from-transparent via-primary-900/5 to-transparent" />

      <div className="section-container relative z-10">
        {/* Section Header */}
        <div className="text-center mb-12 sm:mb-16">
          <h2 className="text-3xl sm:text-4xl md:text-5xl font-bold mb-4 sm:mb-6">
            <span className="gradient-text">{title}</span>
          </h2>
          <p className="text-lg sm:text-xl text-gray-400 max-w-3xl mx-auto leading-relaxed px-4 sm:px-0">
            {subtitle}
          </p>
        </div>

        {/* Projects Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-8 mb-8 sm:mb-12">
          {projects.map((project, index) => (
            <div
              key={project.title}
              className="transform transition-all duration-300 hover:-translate-y-2"
              onClick={() => onProjectClick?.(project)}
            >
              <ProjectCard
                title={project.title}
                description={project.description}
                image={project.image}
                technologies={project.technologies}
                href={project.href}
              />
            </div>
          ))}
        </div>

        {/* View All Button */}
        {showAllButton && (
          <div className="text-center">
            <Button
              variant="primary"
              size="lg"
              onClick={onViewAllClick}
              icon={<ArrowRightIcon className="w-5 h-5" />}
              className="w-full sm:w-auto min-w-[200px]"
            >
              View All Projects
            </Button>
          </div>
        )}
      </div>
    </section>
  );
};

export default ProjectsSection;
