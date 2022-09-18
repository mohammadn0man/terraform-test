var aws = require('aws-sdk');
var ses = new aws.SES({region: 'ap-south-1'});
exports.handler = (event, context, callback) => {
    sendMail("Server is down", "Applicatino server is down");
};

async function sendMail(subject, data) {
  const emailParams = {
        Destination: {
          ToAddresses: ["mohammad.noman@live.in"],
        },
        Message: {
          Body: {
            Text: { Data: data },
          },
          Subject: { Data: subject },
        },
        Source: "mohammad.noman@live.in",
  };
      
  try {
        let key = await ses.sendEmail(emailParams).promise();
        console.log("MAIL SENT SUCCESSFULLY!!");      
  } catch (e) {
        console.log("FAILURE IN SENDING MAIL!!", e);
      }  
  return;
}