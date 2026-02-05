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
    <section className="py-8 sm:py-12 relative overflow-hidden">
      {/* Background decoration */}
      <div className="absolute inset-0 bg-gradient-to-b from-transparent via-primary-900/5 to-transparent" />

      <div className="section-container relative z-10">
        {/* Section Header */}
        <div className="text-center mb-10 sm:mb-14">
          <h2 className="text-2xl sm:text-3xl md:text-4xl font-bold mb-3 sm:mb-4">
            <span className="gradient-text">{title}</span>
          </h2>
          <p className="text-lg sm:text-xl text-gray-400 max-w-3xl mx-auto leading-relaxed px-4 sm:px-0">
            {subtitle}
          </p>
        </div>

        {/* Projects Grid */}
        <div
          className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8 sm:gap-12 lg:gap-16 mb-10 sm:mb-14 project-grid"
          style={{ gap: '3rem' }}
        >
          {projects.map((project, index) => (
            <div
              key={project.title}
              className="transform transition-all duration-300 hover:-translate-y-2 w-full"
              onClick={() => onProjectClick?.(project)}
              style={{ width: '100%', margin: '1rem 0' }}
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
