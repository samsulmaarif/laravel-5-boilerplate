pipeline {
  agent {
    docker { 
      image 'samsulmaarif/php-laravel:7.1' 
      //args '-v ${PWD}:/sdk/platforms'
      reuseNode true
    } 
  }
  options {
    // Stop the build early in case of compile or test failures
    skipStagesAfterUnstable()
  }
  stages {
    stage('Composer') {
      steps {
        sh 'curl -sS https://getcomposer.org/installer | php'
        sh 'php composer.phar install'
        sh 'cp .env.example .env'
        sh 'touch database/database.sqlite'
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