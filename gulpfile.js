'use strict';

var colors = require('colors');
var browserify = require('browserify');
var gulp = require('gulp');
var source = require('vinyl-source-stream');
var buffer = require('vinyl-buffer');
var uglify = require('gulp-uglify');
var sourcemaps = require('gulp-sourcemaps');
var gutil = require('gulp-util');
var coffee = require('gulp-coffee');
var concat = require('gulp-concat');
var del = require('del');
var inject = require('gulp-inject');
var exec = require('child_process').exec;
var cached = require('gulp-cached');
var remember = require('gulp-remember');
var sass = require('gulp-sass');
var plumber = require('gulp-plumber');

///////////////////////////////////////////////// pack
/** clean */
gulp.task('clean:tmp', function(cb) {
    del([
        './tmp'
    ], cb);
});
gulp.task('clean:dist', function(cb) {
    del([
        './dist'
    ], cb);
});

/** dist */
gulp.task('dist', ['coffee'], function() {
    var b = browserify();
    b.add('./tmp/all.js');

    return b.bundle()
        .pipe(plumber())
        .pipe(source('app.min.js'))
        .pipe(buffer())
        .pipe(sourcemaps.init())
        .pipe(uglify())
        .on('error', gutil.log)
        .pipe(sourcemaps.write())
        .pipe(gulp.dest('./dist/js/'));
});

/** coffee compile */
gulp.task('coffee', function() {
    gulp.src(['./coffee/*.coffee', './coffee/*/*.coffee'])
        .pipe(plumber())
        .pipe(cached('coffee'))
        .pipe(coffee({bare: true}).on('error', gutil.log))
        .pipe(sourcemaps.init())
        .pipe(remember('coffee'))
        .pipe(concat('all.js'))
        .pipe(sourcemaps.write())
        .pipe(gulp.dest('./tmp/'));
});
gulp.task('vender:js', function() {
    gulp.src([
        './bower_components/angular/angular.min.js',
        './bower_components/angular-animate/angular-animate.min.js',
        './bower_components/angular-aria/angular-aria.min.js',
        './bower_components/angular-material/angular-material.min.js',
        './bower_components/angular-messages/angular-messages.min.js',
        './bower_components/angular-ui-router/release/angular-ui-router.min.js',
        './bower_components/jquery/dist/jquery.min.js',
        './bower_components/Materialize/dist/js/materialize.min.js'])
        .pipe(sourcemaps.init())
        .pipe(concat('vender.min.js'))
        .pipe(sourcemaps.write())
        .pipe(gulp.dest('./dist/js/'));

});

/** sass compile */
gulp.task('sass', function() {
    gulp.src('./sass/main.scss')
        .pipe(plumber())
        .pipe(sourcemaps.init())
        .pipe(sass({outputStyle: 'compressed'}))
        .pipe(gulp.dest('./dist/css/'));
});
gulp.task('vender:css', function() {
    gulp.src([
        './bower_components/angular-material/angular-material.min.css',
        './bower_components/Ionicons/css/ionicons.min.css',
        './bower_components/Materialize/dist/css/materialize.min.css'])
        .pipe(sourcemaps.init())
        .pipe(concat('vender.min.css'))
        .pipe(sourcemaps.write())
        .pipe(gulp.dest('./dist/css/'));
});

/** font */
gulp.task('vender:font', function() {
    gulp.src([
        './bower_components/Ionicons/fonts/*'])
        .pipe(gulp.dest('./dist/fonts/'));
    gulp.src([
        './bower_components/Materialize/dist/font/roboto/*'])
        .pipe(gulp.dest('./dist/font/roboto/'));
});

/** template */
gulp.task('html', function() {
    gulp.src('./template/*.html')
        .pipe(gulp.dest('./dist/template/'));
});

/** svg */
gulp.task('svg', function() {
    gulp.src('./svg/*')
        .pipe(gulp.dest('./dist/svg/'));
});

/** inject */
gulp.task('inject', ['dist', 'vender:js'], function() {
    var target = gulp.src('./index.html');
    var head = gulp.src(['./dist/js/vender.min.js'], {read: false});
    var sources = gulp.src(['./dist/js/app.min.js', './dist/css/*.css'], {read: false});

    return target
        .pipe(inject(sources))
        .pipe(inject(head, {name: 'vender'}))
        .pipe(gulp.dest('./dist'));
});

/** watch */
gulp.task('watch', function() {
    var watcher = gulp.watch(['coffee/*.coffee', 'coffee/*/*.coffee', 'sass/main.scss', 'template/*.html', 'svg/*.svg'], ['html', 'sass', 'svg', 'dist']);
    watcher.on('change', function(event) {
        console.log(('File Change: ' + event.path).green);
        if(event.type === 'deleted') {
            delete cached.caches.coffee[event.path];
            remember.forget('coffee', event.path);
        }
    });
});

gulp.task('clean', ['clean:tmp', 'clean:dist']);
gulp.task('pack', ['inject', 'watch'], function(cb) {
    del([
        './tmp'
    ], cb);

    exec('node_modules/lite-server/bin/lite-server --open ./dist', function(err) {
        if(err) return cb(err);
        cb();
    });
});
///////////////////////////////////////////////// pack end

///////////////////////////////////////////////// develop end
gulp.task('d:c', function(cb) {
    del([
        'coffee/*.js',
        'coffee/*/*.js',
        'sass/*.css'
    ], cb);
});
gulp.task('develop:coffee', function() {
    gulp.src(['coffee/*.coffee', 'coffee/*/*.coffee'])
        .pipe(plumber())
        .pipe(coffee({bare: true}).on('error', gutil.log))
        .pipe(gulp.dest('coffee/'));
});
gulp.task('develop:sass', function() {
    gulp.src(['sass/*.scss'])
        .pipe(plumber())
        .pipe(sass())
        .pipe(gulp.dest('sass/'));
});
gulp.task('develop:watch', function() {
    gulp.watch(['coffee/*.coffee', 'coffee/*/*.coffee', 'sass/*.scss', 'template/*.html'], ['develop:coffee', 'develop:sass']);
});
gulp.task('default', ['develop:coffee', 'develop:sass', 'develop:watch'], function(cb) {
    exec('node_modules/lite-server/bin/lite-server', {maxBuffer: 1024 * 500}, function(err) {
        if(err) return cb(err);
        cb();
    });
});
