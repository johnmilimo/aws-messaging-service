@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  java-demo startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and JAVA_DEMO_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\java-demo.jar;%APP_HOME%\lib\guava-23.0.jar;%APP_HOME%\lib\aws-java-sdk-1.11.380.jar;%APP_HOME%\lib\jsr305-1.3.9.jar;%APP_HOME%\lib\error_prone_annotations-2.0.18.jar;%APP_HOME%\lib\j2objc-annotations-1.1.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.14.jar;%APP_HOME%\lib\aws-java-sdk-dlm-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-macie-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-eks-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-mediatailor-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-neptune-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-pi-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-iot1clickprojects-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-iot1clickdevices-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-iotanalytics-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-acmpca-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-secretsmanager-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-fms-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-connect-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-transcribe-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-autoscalingplans-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-workmail-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-servicediscovery-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-cloud9-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-serverlessapplicationrepository-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-alexaforbusiness-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-resourcegroups-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-comprehend-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-translate-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-sagemaker-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-iotjobsdataplane-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-sagemakerruntime-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-kinesisvideo-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-appsync-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-guardduty-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-mq-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-mediaconvert-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-mediastore-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-mediastoredata-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-medialive-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-mediapackage-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-costexplorer-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-pricing-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-mobile-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-cloudhsmv2-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-glue-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-migrationhub-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-dax-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-greengrass-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-athena-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-marketplaceentitlement-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-codestar-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-lexmodelbuilding-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-resourcegroupstaggingapi-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-pinpoint-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-xray-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-opsworkscm-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-support-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-simpledb-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-servicecatalog-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-servermigration-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-swf-libraries-1.11.22.jar;%APP_HOME%\lib\aws-java-sdk-simpleworkflow-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-storagegateway-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-route53-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-glacier-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-cloudwatchmetrics-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-dynamodb-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-s3-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-importexport-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-sts-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-sns-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-sqs-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-rds-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-redshift-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-elasticbeanstalk-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-iam-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-datapipeline-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-elasticloadbalancing-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-elasticloadbalancingv2-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-emr-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-elasticache-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-elastictranscoder-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-ec2-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-budgets-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-cloudtrail-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-cloudwatch-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-logs-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-events-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-cognitoidentity-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-cognitosync-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-directconnect-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-cloudformation-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-cloudfront-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-clouddirectory-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-kinesis-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-opsworks-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-ses-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-autoscaling-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-cloudsearch-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-codedeploy-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-codepipeline-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-kms-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-config-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-lambda-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-ecs-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-ecr-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-cloudhsm-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-ssm-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-workspaces-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-machinelearning-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-directory-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-efs-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-codecommit-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-devicefarm-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-elasticsearch-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-waf-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-marketplacecommerceanalytics-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-inspector-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-iot-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-api-gateway-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-acm-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-gamelift-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-dms-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-marketplacemeteringservice-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-cognitoidp-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-discovery-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-applicationautoscaling-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-snowball-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-rekognition-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-polly-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-lightsail-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-stepfunctions-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-health-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-costandusagereport-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-codebuild-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-appstream-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-shield-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-batch-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-lex-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-mechanicalturkrequester-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-organizations-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-workdocs-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-core-1.11.380.jar;%APP_HOME%\lib\aws-java-sdk-models-1.11.380.jar;%APP_HOME%\lib\jmespath-java-1.11.380.jar;%APP_HOME%\lib\netty-codec-http-4.1.17.Final.jar;%APP_HOME%\lib\netty-handler-4.1.17.Final.jar;%APP_HOME%\lib\httpclient-4.5.5.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\ion-java-1.0.2.jar;%APP_HOME%\lib\jackson-databind-2.6.7.1.jar;%APP_HOME%\lib\jackson-dataformat-cbor-2.6.7.jar;%APP_HOME%\lib\joda-time-2.8.1.jar;%APP_HOME%\lib\netty-codec-4.1.17.Final.jar;%APP_HOME%\lib\netty-transport-4.1.17.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.17.Final.jar;%APP_HOME%\lib\httpcore-4.4.9.jar;%APP_HOME%\lib\commons-codec-1.10.jar;%APP_HOME%\lib\jackson-annotations-2.6.0.jar;%APP_HOME%\lib\jackson-core-2.6.7.jar;%APP_HOME%\lib\netty-resolver-4.1.17.Final.jar;%APP_HOME%\lib\netty-common-4.1.17.Final.jar

@rem Execute java-demo
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %JAVA_DEMO_OPTS%  -classpath "%CLASSPATH%" App %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable JAVA_DEMO_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%JAVA_DEMO_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
