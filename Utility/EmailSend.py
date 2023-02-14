import os
import smtplib
import zipfile
from email import encoders
from email.mime.base import MIMEBase
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

class EmailSend:
    def zipdir(self, path, zipheap):
        for root, dirs, files in os.walk(path):
            for file in files:
                zipheap.write(os.path.join(root, file))

    def sendingEmail(self,fromAddress,toAddress,fromPass,):

        fromaddr = fromAddress
        toaddr = toAddress
        fromPassword = fromPass

        msg = MIMEMultipart()
        msg['From'] = fromaddr
        msg['To'] = toaddr
        msg['Subject'] = "TAWASOL Smoke Test Execution Report"
        body = "Three are dead in an attack in the sewers below sector 7."


        zipf = zipfile.ZipFile('Report.zip', 'w', zipfile.ZIP_DEFLATED)
        self.zipdir('./Reports', zipf)
        zipf.close()

        msg.attach(MIMEText(body, 'plain'))
        filename = "Report.zip"
        attachment = open("./Report.zip", "rb")
        p = MIMEBase('application', 'octet-stream')
        p.set_payload((attachment).read())
        encoders.encode_base64(p)
        p.add_header('Content-Disposition', "attachment; filename= %s" % filename)
        msg.attach(p)


        s = smtplib.SMTP('smtp.gmail.com', 465)
        #s = smtplib.SMTP('10.0.0.15', 25)

        s.starttls()
        s.login(fromaddr, fromPassword)

        text = msg.as_string()
        s.sendmail(fromaddr, toaddr.split(','), text)
        s.quit()