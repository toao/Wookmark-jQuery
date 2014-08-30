module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-docco'

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON 'wookmark.jquery.json'
    meta:
      banner: '/*!\n' +
        'jQuery <%= pkg.name %> plugin\n' +
        '@name <%= pkg.name %>.js\n' +
        '@author Christoph Ono (chri@sto.ph or @gbks)\n' +
        '@author Sebastian Helzle (sebastian@helzle.net or @sebobo)\n' +
        '@version <%= pkg.version %>\n' +
        '@date <%= grunt.template.today("mm/dd/yyyy") %>\n' +
        '@category jQuery plugin\n' +
        '@copyright (c) 2009-2014 Christoph Ono (www.wookmark.com)\n' +
        '@license Licensed under the MIT (http://www.opensource.org/licenses/mit-license.php) license.\n' +
      '*/\n'
    uglify:
      dist:
        options:
          banner: '<%= meta.banner %>'
        files:
          '<%= pkg.name %>.min.js': ['<%= pkg.name %>.js']
    docco:
      dist:
        src: ['<%= pkg.name %>.js']
        options:
          output: 'doc/'

  # Release task to run tests then minify js and css
  grunt.registerTask 'release', ['uglify', 'docco']
