pipeline {
  agent none
  stages {
    stage('repository_pull') {
      agent {
        docker { 
          image 'samsulmaarif/php-laravel:7.1'
          reuseNode true
        } 
      }
      steps {
        // Checkout the master branch of the Laravel framework repository
        sh 'env | sort'
        git branch: 'master', url: 'https://github.com/samsulmaarif/laravel-5-boilerplate.git'
      }
    }
    stage('Unit Testing') {
      parallel {
        stage('php 7.1') {
          agent {
            docker { 
              image 'samsulmaarif/php-laravel:7.1'
              //reuseNode true
            } 
          }
          steps {
            sh 'composer -v'
            sh 'composer install -n --prefer-dist'
            sh 'cp .env.testing .env'
            sh 'touch database/database.sqlite'
            sh 'touch storage/testing.sqlite'
            sh 'php -v'
            sh 'php artisan key:generate'
            sh 'php artisan migrate --env=testing --database=sqlite_testing --force'
            //sh 'php artisan db:seed'
            //sh 'vendor/bin/codecept build'
            //sh 'vendor/bin/codecept run'
          }
        }
        // stage('php 5.6') {
        //   agent {
        //     docker { 
        //       image 'samsulmaarif/php-laravel:5.6'
        //       //reuseNode true
        //     } 
        //   }
        //   steps {
        //     sh 'composer -v'
        //     sh 'composer install -n --prefer-dist'
        //     sh 'cp .env.testing .env'
        //     sh 'touch database/database.sqlite'
        //     sh 'touch storage/testing.sqlite'
        //     sh 'php -v'
        //     sh 'php artisan key:generate'
        //     sh 'php artisan migrate --env=testing --database=sqlite_testing --force'
        //     //sh 'php artisan db:seed'
        //     //sh 'vendor/bin/codecept build'
        //     //sh 'vendor/bin/codecept run'
        //   }
        // }
      }
    }
    stage('We are deploying') {
       agent any // {
         // docker {
         //  image 'williamyeh/ansible:centos7'
         //  args '-v "/var/lib/jenkins/.ssh:/root/.ssh"'
         //}
       //}
       steps {
         sh 'bash ansible/run.sh development'
       }
    }

  }
}
