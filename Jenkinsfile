pipeline {
  agent any //{
    //docker { 
    //  image 'samsulmaarif/php-laravel:7.1'
    //  label 'dotdocker'
      //args '-v /tmp/composer-XXX:/root/.composer'
    //  reuseNode true
    //} 
  //}
  options {
    // Stop the build early in case of compile or test failures
    skipStagesAfterUnstable()
  }
  stages {
    stage('repository_pull') {
      steps {
      // Checkout the master branch of the Laravel framework repository
      sh 'env | sort'
      git branch: 'master', url: 'https://github.com/linuxsidareja/laravel-5-boilerplate.git'
      }
    }
    stage('Composer') {
      steps {
        //sh 'whoami && pwd && cat /etc/*release'
        sh 'curl -sS https://getcomposer.org/installer | php'
        sh 'php composer.phar install'
        sh 'cp .env.testing .env'
        sh 'touch database/testing.sqlite'
        sh 'php artisan key:generate'
        sh 'php artisan migrate'
        sh 'php artisan db:seed'
      }
    }
    stage('Unit test') {
       steps {
         sh 'vendor/bin/phpunit'
       }
    }
    // stage('') {
    //  steps {
    //    sh ''
    //  }
    // }
  }
  // post {
  //   failure {
  //     // Notify developer team of the failure
  //     mail to: 'samsul@dot-indonesia.com', subject: 'Oops!', body: "Build ${env.BUILD_NUMBER} failed; ${env.BUILD_URL}"
  //   }
  // }
}