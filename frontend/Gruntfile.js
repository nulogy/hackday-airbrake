module.exports = function (grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    watch: {
      js: {
        files: ['js/**/*.js'],
        tasks: ['copy:development'],
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
          appDir: 'js',
          baseUrl: '.',
          dir: '../public/js',
          mainConfigFile: 'js/requireConfig.js',
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
      lib: {
        files: [
         {
          src: 'bower_components/bootstrap/dist/js/bootstrap.js',
          dest: 'js/lib/bootstrap.js',
        }, {
          src: 'bower_components/jquery/dist/jquery.js',
          dest: 'js/lib/jquery.js',
        }, {
          src: 'bower_components/select2/select2.js',
          dest: 'js/lib/select2.js',
        }, {
          src: 'bower_components/angular/angular.js',
          dest: 'js/lib/angular.js',
        }, {
          src: 'bower_components/angular-bootstrap/ui-bootstrap-tpls.js',
          dest: 'js/lib/angular-bootstrap.js',
        }, {
          src: 'bower_components/lodash/dist/lodash.js',
          dest: 'js/lib/lodash.js',
        }]
      },
      development: {
        files: [{
          expand: true,
          cwd: 'img/',
          src: ['*'],
          dest: '../public/css/'
        }, {
          src: 'js/**/*',
          dest: '../public/'
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
  grunt.registerTask('development', ['jade:development', 'less:development', 'copy:lib', 'copy:development', 'watch']);
  grunt.registerTask('build', ['copy:development', 'requirejs','jade:production', 'less:production', 'copy:production']);
};