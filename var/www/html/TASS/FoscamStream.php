<?php session_start();

$pageDetails = [
    "PageID" => "TASS"
];

include dirname(__FILE__) . '/../../classes/startup/init.php';
include dirname(__FILE__) . '/../../classes/users/core.php';
include dirname(__FILE__) . '/../../classes/iotJumpWay/Devices.php';
include dirname(__FILE__) . '/../../classes/TASS/core.php';
include dirname(__FILE__) . '/../../classes/TASS/Foscam.php';

$device      =$_GeniSys->_confs['tassID'] ? $_iotJumpWayDevices->getDevice($_GeniSys->_confs['tassID']) : null;
$jdevices    = $_iotJumpWayDevices->getDeviceList();
$devices     = $_TASSfoscam->getTASSfoscams();
$tassFoscam  = filter_input(INPUT_GET,'device',FILTER_SANITIZE_NUMBER_INT) ? $_TASSfoscam->getTASSfoscam(filter_input(INPUT_GET,'device',FILTER_SANITIZE_NUMBER_INT)) : null; 

#print_r($tassFoscam);
#session_destroy();
$_users->checkSession();

?>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <META name="robots" content="noindex, nofollow">

        <!-- 
          /*********************************************************
          ** @project GeniSys AI Location UI
          ** @author  Adam Milton-Barker <www.adammiltonbarker.com>
          **********************************************************/	
        -->

        <title><?=$_GeniSys->_confs["meta_title"]; ?></title>
        <meta name="description" content="<?=$_GeniSys->_confs["meta_description"]; ?>">
        <meta name="author" content="Adam Milton-Barker">

        <link type="text/css" rel="stylesheet" href="<?=$_GeniSys->_confs["domainString"]; ?>/media/vendor/bootstrap/css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="<?=$_GeniSys->_confs["domainString"]; ?>/media/vendor/metisMenu/metisMenu.min.css">
        <link type="text/css" rel="stylesheet" href="<?=$_GeniSys->_confs["domainString"]; ?>/media/css/sb-admin-2.css">
        <link type="text/css" rel="stylesheet" href="<?=$_GeniSys->_confs["domainString"]; ?>/media/vendor/font-awesome/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="<?=$_GeniSys->_confs["domainString"]; ?>/media/GeniSys/GeniSys.css">
    
        <link type="image/x-icon" rel="icon" href="<?=$_GeniSys->_confs["domainString"]; ?>/media/images/site/favicon.png" />
        <link type="image/x-icon" rel="shortcut icon" href="<?=$_GeniSys->_confs["domainString"]; ?>/media/images/site/favicon.png" />
        <link type="image/x-icon" rel="apple-touch-icon" href="<?=$_GeniSys->_confs["domainString"]; ?>/media/images/site/favicon.png" />

        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
    
        <div id="wrapper">

            <?php include dirname(__FILE__) . '/../includes/nav.php'; ?>

            <div id="page-wrapper">

                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">TASS FOSCAM DEVICES</h1>
                    </div>
                </div>

                <?php include dirname(__FILE__) . '/../TASS/includes/TASSfoscam.php'; ?>
                <div class="clear"></div>
                
                <div class="row">

                    <div class="col-lg-8">

                        <div class="panel panel-default">

                            <div class="panel-heading">

                                <i class="fa fa-cogs fa-fw"></i> View TASS Foscam Stream #<?=filter_input(INPUT_GET,'device',FILTER_SANITIZE_NUMBER_INT); ?>

                                <div class="pull-right">

                                    <div class="btn-group">

                                        <a href="<?=$_GeniSys->_confs["domainString"]; ?>/TASS/FoscamAdd"><i class="fa fa-plus-circle fa-fw"></i></a> 

                                    </div>

                                </div>

                            </div>
                            
                            <div class="panel-body">
                                        
                                <img src="<?=$tassFoscam["ResponseData"]["Stream"] ? $_GeniSys->_helpers->decrypt($tassFoscam["ResponseData"]["Stream"]) : ""; ?>/<?=time(); ?>.mjpg"  style="width: 100%;" />

                            </div>
                            
                        </div>
                        
                    </div>
                    <div class="col-lg-4">
                        
                        <div class="panel panel-default">
                
                            <div class="panel-heading">
                
                                <i class="fa fa-exclamation fa-fw"></i> TASS Foscam Stream Controls
                
                            </div>
                            
                            <div class="panel-body">

                                <div class="list-group">
                                    <a href="" class="list-group-item" id="flip">
                                        <i class="fa fa-rotate-right fa-1x"></i> Flip Camera Stream #<?=abs($tassFoscam["ResponseData"]["id"]); ?>
                                    </a>
                                </div>

                                <div class="list-group">
                                    <a href="" class="list-group-item" id="flip">
                                        <i class="fa fa-rotate-right fa-1x"></i> Flip Camera Stream #<?=abs($tassFoscam["ResponseData"]["id"]); ?>
                                    </a>
                                </div>

                            </div>

                        </div>
        
                        <?php  include dirname(__FILE__) . '/../TASS/includes/TASSfoscamC.php'; ?>

                    </div>
                        
                </div>

            </div>
        
        </div>
        
        <?php  include dirname(__FILE__) . '/../includes/scripts.php'; ?>

        <script type="text/javascript">
        
        </script>
 
    </body>

</html> 