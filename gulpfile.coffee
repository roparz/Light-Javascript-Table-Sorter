gulp = require('gulp')
coffee = require('gulp-coffee')
uglify = require('gulp-uglify')
rename = require('gulp-rename')

gulp.task 'default', ->

    gulp.src('light-table-sorter.coffee')
        .pipe(coffee({ bare: true }))
        .pipe(gulp.dest(__dirname))
        .pipe(rename({ suffix: '.min' }))
        .pipe(uglify())
        .pipe(gulp.dest(__dirname))
