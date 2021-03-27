const bool isProduction = false;

const SERVICE_URL = isProduction
    ? "http://dabsterdev-env.eba-xptteke2.ca-central-1.elasticbeanstalk.com/api/"
    : "http://spyder.primefocussol.com:2822/api/"; //http://192.168.1.93:2181/api/

bool isLoggedIn = false;
int userId;
String email;
String password;
String firstName;
String lastname;
 String apiKey;
