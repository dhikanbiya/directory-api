<?php
// DIC configuration

$container = $app->getContainer();

// view renderer
$container['renderer'] = function ($c) {
    $settings = $c->get('settings')['renderer'];
    return new Slim\Views\PhpRenderer($settings['template_path']);
};

// monolog
$container['logger'] = function ($c) {
    $settings = $c->get('settings')['logger'];
    $logger = new Monolog\Logger($settings['name']);
    $logger->pushProcessor(new Monolog\Processor\UidProcessor());
    $logger->pushHandler(new Monolog\Handler\StreamHandler($settings['path'], $settings['level']));
    return $logger;
};

//msyql
$container['db'] = function ($c) {
    $settings = $c->get('settings')['db'];
    $pdo = new PDO("mysql:host=" . $settings['host'] . ";dbname=" . $settings['dbname'],
        $settings['user'], $settings['pass']);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    return $pdo;
};

//validator
use Respect\Validation\Validator as v;
$container['loginValidation'] = function($c){
    $passwordValidator = v::alnum()->noWhitespace()->length(5, 10);
    $emailValidator = v::email();    
    $deviceValidator = v::alnum();

    $validators = array(
        'email' => $emailValidator,
        'password' => $passwordValidator,
        'device' => $deviceValidator
    );
    return new \DavidePastore\Slim\Validation\Validation($validators);
};



$container['regValidation'] = function($c){
	$usernameValidator = v::alnum()->noWhitespace()->length(5, 10);
    $passwordValidator = v::alnum()->noWhitespace()->length(5, 10);
    $emailValidator = v::email();    

    $validators = array(
        'username' => $usernameValidator,
        'password' => $passwordValidator,
        'email' => $emailValidator
    );
    return new \DavidePastore\Slim\Validation\Validation($validators);
};

$container['reqValidation'] = function($c){    
    $tokenValidator = v::alnum();
    $deviceValidator = v::alnum();

    $validators = array(        
        'token' => $tokenValidator,
        'device' => $deviceValidator

    );
    return new \DavidePastore\Slim\Validation\Validation($validators);
};









