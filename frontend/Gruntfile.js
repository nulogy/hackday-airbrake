module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    watch: {
      options: {
        livereload: true
      },
      js: {
        files: ['js/**/*.js'],
        tasks: [],
      },
      jade: {
        files: ['jade/**/*.jade'],
        tasks: ['jade:development']
      },
      less: {
        files: ['less/**/*.less'],
        tasks: ['less:development']
      }
    },
    connect: {
      server: {
        options: {
          port: 8282,
          base: '.'
        }
      }
    },
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      build: {
        src: 'src/<%= pkg.name %>.js',
        dest: 'build/<%= pkg.name %>.min.js'
      }
    },
    requirejs: {
      compile: {
        options: {
          almond: true,
          findNestedDependencies: true,
          removeCombined: true,
          skipDirOptimize: true,
          fileExclusionRegExp: /^\./,
          appDir: '',
          baseUrl: 'js/',
          mainConfigFile: 'js/requireConfig.js',
          dir: 'dist/js',
          modules: [{
            name: 'airbrake-frontend/common'
          }, {
            name: 'airbrake-frontend/main',
            exclude: ['airbrake-frontend/common']
          }]
        }
      }
    },
    jade: {
      development: {
        options: {
          data: {
            environment: "development"
          },
          pretty: true
        },
        files: {
          "html/index.html": "jade/index.jade"
        }
      },
      production: {
        options: {
          data: {
            environment: "production"
          },
          pretty: true
        },
        files: {
          "dist/index.html": "jade/index.jade"
        }
      }
    },
    less: {
      development: {
        options: {
          paths: ["less"]
        },
        files: {
          "css/common.css": "less/common.less",
          "css/main.css": "less/main.less"
        }
      },
      production: {
        options: {
          paths: ["less"]
        },
        files: {
          "dist/css/common.css": "less/common.less",
          "dist/css/main.css": "less/main.less"
        }
      }
    },
    copy: {
      main: {
        files: [{
          src: 'img/*',
          dest: 'dist/'
        }, {
          src: 'fonts/*',
          dest: 'dist/'
        }]
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-jade');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-requirejs');
  grunt.loadNpmTasks('grunt-contrib-copy');

  grunt.registerTask('default', ['connect', 'watch']);
  grunt.registerTask('server', ['connect', 'jade:development', 'less:development', 'watch']);
  grunt.registerTask('build', ['requirejs','jade:production', 'less:production', 'copy']);
};