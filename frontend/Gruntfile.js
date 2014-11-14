module.exports = function (grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    watch: {
      js: {
        files: ['js/**/*.js'],
        tasks: ['requirejs', 'copy:development'],
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
          base: './public'
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
          appDir: '../public/js',
          baseUrl: './',
          mainConfigFile: 'js/requireConfig.js',
          dir: '../../public/js',
          modules: [{
            name: 'common'
          }, {
            name: 'main',
            exclude: ['common']
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
          "../public/index.html": "jade/index.jade"
        }
      },
      production: {
        options: {
          data: {
            environment: "production"
          },
          pretty: false
        },
        files: {
          "../public/index.html": "jade/index.jade"
        }
      }
    },
    less: {
      development: {
        options: {
          paths: ["less"]
        },
        files: {
          "../public/css/common.css": "less/common.less",
          "../public/css/main.css": "less/main.less"
        }
      },
      production: {
        options: {
          paths: ["less"]
        },
        files: {
          "../public/css/common.css": "less/common.less",
          "../public/css/main.css": "less/main.less"
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
          dest: '../dist/'
        }]
      },
      development: {
        files: [{
          expand: true,
          cwd: 'img/',
          src: ['*'],
          dest: '../public/css/'
        }, {
          src: 'js/*',
          dest: '../public/'
        }, {
          src: 'bower_components/requirejs/require.js',
          dest: '../public/js/require.js'
        }, {
          src: 'bower_components/bootstrap/dist/js/bootstrap.js',
          dest: '../public/js/bootstrap.js'
        }, {
          src: 'bower_components/jquery/dist/jquery.js',
          dest: '../public/js/jquery.js'
        }, {
          src: 'bower_components/select2/select2.js',
          dest: '../public/js/select2.js',
        }, {
          src: 'bower_components/angular/angular.js',
          dest: '../public/js/angular.js'
        }, {
          src: 'bower_components/lodash/dist/lodash.js',
          dest: '../public/js/lodash.js'
        }]
      },
      production: {
       files: [{
          expand: true,
          cwd: 'img/',
          src: ['*'],
          dest: '../public/css/'
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
  grunt.registerTask('server', ['connect', 'jade:development', 'less:development', 'copy:development', 'watch']);
  grunt.registerTask('development', ['jade:development', 'less:development', 'copy:development', 'requirejs', 'watch']);
  grunt.registerTask('build', ['copy:development', 'requirejs','jade:production', 'less:production', 'copy:production']);
};