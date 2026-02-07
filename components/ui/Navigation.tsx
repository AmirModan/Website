import React, { useState, useEffect } from 'react';
import {
  Bars3Icon,
  XMarkIcon,
  UserIcon,
  AcademicCapIcon,
  CodeBracketIcon,
  DocumentTextIcon,
} from '@heroicons/react/24/outline';
import { Button } from './Button';
import { useRouter } from 'next/router';

const navItems = [
  { name: 'About Me', href: '#aboutMe-section', icon: UserIcon },
  { name: 'My Research', href: '#research-section', icon: AcademicCapIcon },
  { name: 'My Projects', href: '#projects-section', icon: CodeBracketIcon },
  { name: 'My Resume', href: '#resume-section', icon: DocumentTextIcon },
];

export const Navigation: React.FC = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);
  const router = useRouter();

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 20);
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const handleNavClick = (e: React.MouseEvent, href: string) => {
    e.preventDefault();
    const element = document.querySelector(href);
    if (element) {
      element.scrollIntoView({ behavior: 'smooth' });
    }
    setIsOpen(false);
  };

  const handleLogoClick = (e: React.MouseEvent) => {
    e.preventDefault();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  return (
    <>
      <nav
        className={`
          fixed top-0 left-0 right-0 z-50 transition-all duration-300
          ${scrolled ? 'glass-morphism shadow-lg' : 'bg-transparent'}
        `}
      >
        <div className="section-container">
          <div className="flex items-center justify-between h-12">
            {/* Logo */}
            <a
              href="#aboutMe-section"
              onClick={handleLogoClick}
              className="flex items-center space-x-1.5 sm:space-x-2 group transition-transform hover:scale-102"
            >
              <div className="w-14 h-14 sm:w-16 sm:h-16 bg-gradient-to-br from-primary-500 to-accent-500 rounded-sm flex items-center justify-center group-hover:shadow-sm transition-shadow">
                <img
                  src="/Images/Home-Icon.png"
                  alt="Home"
                  className="w-10 h-10 sm:w-12 sm:h-12"
                />
              </div>
              <span className="text-sm sm:text-base font-bold gradient-text hidden sm:block">
                Amir Modan
              </span>
            </a>

            {/* Desktop Navigation */}
            <div className="hidden lg:flex items-center space-x-1">
              {navItems.map((item) => (
                <div
                  key={item.name}
                  className="nav-link text-sm sm:text-base flex items-center gap-2 cursor-default"
                >
                  <item.icon className="w-4 h-4 sm:w-5 sm:h-5" />
                  {item.name}
                </div>
              ))}
              <Button
                variant="primary"
                size="sm"
                onClick={() => router.push('/contact')}
                className="ml-2 sm:ml-4"
              >
                Contact Me
              </Button>
            </div>

            {/* Tablet Navigation */}
            <div className="hidden md:flex lg:hidden items-center space-x-1">
              {navItems.slice(0, 2).map((item) => (
                <div
                  key={item.name}
                  className="nav-link text-sm px-3 py-1 flex items-center gap-2 cursor-default"
                >
                  <item.icon className="w-4 h-4" />
                  {item.name}
                </div>
              ))}
              <Button
                variant="primary"
                size="sm"
                onClick={() => router.push('/contact')}
                className="ml-2"
              >
                Contact
              </Button>
            </div>

            {/* Mobile menu button */}
            <button
              onClick={() => setIsOpen(!isOpen)}
              className="md:hidden p-2 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 transition-colors"
            >
              {isOpen ? (
                <XMarkIcon className="h-10 w-10 sm:h-12 sm:w-12" />
              ) : (
                <Bars3Icon className="h-10 w-10 sm:h-12 sm:w-12" />
              )}
            </button>
          </div>
        </div>

        {/* Mobile Navigation */}
        {isOpen && (
          <div className="md:hidden glass-morphism border-t border-white/20 transition-all duration-300">
            <div className="px-4 py-6 space-y-1">
              {navItems.map((item) => (
                <div
                  key={item.name}
                  className="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 transition-all duration-200 font-medium text-sm flex items-center gap-3 cursor-default"
                >
                  <item.icon className="w-5 h-5" />
                  {item.name}
                </div>
              ))}
              <div className="pt-4 border-t border-white/10">
                <Button
                  variant="primary"
                  className="w-full"
                  onClick={() => {
                    router.push('/contact');
                    setIsOpen(false);
                  }}
                >
                  Contact Me
                </Button>
              </div>
            </div>
          </div>
        )}
      </nav>

      {/* Spacer for fixed nav */}
      <div className="h-12" />
    </>
  );
};
