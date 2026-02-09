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
          fixed top-0 left-0 right-0 z-50 transition-all duration-300 'bg-transparent'}
        `}
      >
        <div className="section-container">
          <div className="flex items-center justify-between h-12 px-12">
            {/* Logo */}
            <a
              href="#aboutMe-section"
              onClick={handleLogoClick}
              className="flex items-center space-x-3 sm:space-x-4 group transition-transform hover:scale-102"
            >
              <div className="w-16 h-16 sm:w-20 sm:h-20 bg-gradient-to-br from-primary-500 to-accent-500 rounded-sm flex items-center justify-center group-hover:shadow-sm transition-shadow">
                <img
                  src="/Images/Home-Icon.png"
                  alt="Home"
                  className="w-12 h-12 sm:w-16 sm:h-16"
                />
              </div>
              <span className="text-sm sm:text-base font-bold gradient-text hidden sm:block">
                Amir Modan
              </span>
            </a>

            {/* Desktop Navigation */}
            <div className="hidden lg:flex items-center space-x-12">
              {navItems.map((item) => (
                <a
                  key={item.name}
                  href={item.href}
                  onClick={(e) => handleNavClick(e, item.href)}
                  className="text-sm sm:text-base flex items-center gap-2 text-gray-300 hover:text-white transition-colors duration-200"
                  style={{ textDecoration: 'none' }}
                >
                  <item.icon className="w-4 h-4 sm:w-5 sm:h-5" />
                  {item.name}
                </a>
              ))}
              <Button
                variant="primary"
                size="sm"
                onClick={() => router.push('/contact')}
                className="ml-12"
              >
                Contact Me
              </Button>
            </div>

            {/* Tablet Navigation */}
            <div className="hidden md:flex lg:hidden items-center space-x-10">
              {navItems.slice(0, 2).map((item) => (
                <a
                  key={item.name}
                  href={item.href}
                  onClick={(e) => handleNavClick(e, item.href)}
                  className="text-sm px-3 py-1 flex items-center gap-2 text-gray-300 hover:text-white transition-colors duration-200"
                  style={{ textDecoration: 'none' }}
                >
                  <item.icon className="w-4 h-4" />
                  {item.name}
                </a>
              ))}
              <Button
                variant="primary"
                size="sm"
                onClick={() => router.push('/contact')}
                className="ml-10"
              >
                Contact
              </Button>
            </div>

            {/* Mobile menu button */}
            <button
              onClick={() => setIsOpen(!isOpen)}
              className="md:hidden p-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 transition-colors"
            >
              {isOpen ? (
                <XMarkIcon className="h-12 w-12 sm:h-14 sm:w-14" />
              ) : (
                <Bars3Icon className="h-12 w-12 sm:h-14 sm:w-14" />
              )}
            </button>
          </div>
        </div>

        {/* Mobile Navigation */}
        <div
          className={`
            md:hidden glass-morphism border-t border-white/20 transition-all duration-300 overflow-hidden
            ${isOpen ? 'max-h-[400px] opacity-100' : 'max-h-0 opacity-0'}
          `}
        >
          <div className="px-4 py-8 space-y-4">
            {navItems.map((item) => (
              <a
              key={item.name}
              href={item.href}
              onClick={(e) => handleNavClick(e, item.href)}
              className="block px-4 py-4 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 transition-all duration-200 font-medium text-sm flex items-center gap-3"
              style={{ textDecoration: 'none' }}
            >
              <item.icon className="w-5 h-5" />
              {item.name}
            </a>
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
      </nav>

      {/* Spacer for fixed nav */}
      <div className="h-12" />
    </>
  );
};
