echo "Launch FortiMail Tester, Aurélien Pinon";
cd /root/mail-gen
echo "Sending clean Email"
swaks -s gw16131.fortimail.com -f clean@gmail.com -t sefrance@o365-fml.forti.pro --ehlo gmail.com --header "Subject:Clean Email $(date)" --body 'Clean Email'
echo "Cleanup"

echo "Sending test Email-AV"
echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*' | swaks -s gw16131.fortimail.com -f av@gmail.com -t sefrance@o365-fml.forti.pro --ehlo "gmail.com" --header "Subject:Test AV $(date)"  --body 'Test AV' --attach-name vir.exe  --attach -

echo "Sending test Email-AV-Outbreak"
echo -n | swaks -s gw16131.fortimail.com -f av-out@gmail.com -t sefrance@o365-fml.forti.pro --attach-name vir.exe --ehlo gmail.com --header "Subject:Test AV Outbreak $date" --body 'Test AV Outbreak' --attach -

echo "Sending test Email-FSA"
wget http://badfile.fsa/downloader/`date +%X-` -O - | swaks -s gw16131.fortimail.com -f fsa@gmail.com -t sefrance@o365-fml.forti.pro --ehlo gmail.com --header "Subject:Test FSA $(date)" --body 'Test FSA' --attach -

echo "Sending test Email-SPAM"
swaks -s gw16131.fortimail.com -f spam@gmail.com -t sefrance@o365-fml.forti.pro --header "Subject:Test SPAM $(date)" --body ./gtube --ehlo gmail.com

echo "Sending test Email-PHISH"
swaks -s gw16131.fortimail.com -f phish@gmail.com -t sefrance@o365-fml.forti.pro --header "Subject:Test PHISH $(date)" --body 'Visit: http://sinmessenger.com/' --ehlo gmail.com

echo "Sending test Email-WF"
swaks -s gw16131.fortimail.com -f wf@gmail.com -t sefrance@o365-fml.forti.pro --header "Subject:Test WF $(date)" --body 'You have a friend: http://www.facebook.com' --ehlo gmail.com

echo "Sending test Email-HTML-Disarm"
cat ./tosanitize.dat | swaks -s gw16131.fortimail.com -f html@gmail.com -t sefrance@o365-fml.forti.pro --ehlo gmail.com --data -

echo "Sending test Email-Remove-URI"
swaks -s gw16131.fortimail.com -f uri@gmail.com -t sefrance@o365-fml.forti.pro --ehlo gmail.com --header "Subject:Test URI Remove $(date)" --body 'please visit http://www.fortinet.com and http://bongacams.com/ and http://www.cnn.com'

echo "Sending test Email-TimeOfClick"
cat ./toc.dat | swaks -s gw16131.fortimail.com -f click@gmail.com -t sefrance@o365-fml.forti.pro --ehlo gmail.com --data -

echo "Sending test Email-Word-Disarm"
swaks -s gw16131.fortimail.com -f cdr@gmail.com -t sefrance@o365-fml.forti.pro --ehlo gmail.com --header "Subject:Test Word Content Disarm $(date)" --attach ./INSCRIPTION.docx

echo "Sending test Email-PDF-Disarm"
to=$(shuf -n 1 ./user.txt)
swaks -s gw16131.fortimail.com -f cdr@gmail.com -t sefrance@o365-fml.forti.pro --ehlo gmail.com --header "Subject:Test PDF Content Disarm $(date)" --attach ./INSCRIPTION.pdf

echo "Sending test Email-BEC"
swaks -s gw16131.fortimail.com -f bec@gmail.com -t sefrance@o365-fml.forti.pro --ehlo gmail.com --header-From "FRChannel <bec@gmail.com>" --header "Subject:Test BEC $(date)" --body 'Test BEC'

echo "Sending test Email-Cousin"
swaks -s gw16131.fortimail.com -f cousin@o365-fml.f0rti.pro -t sefrance@o365-fml.forti.pro --ehlo gmail.com --header "Subject:Test Cousin Domain $(date)" --body 'Test Cousin'

echo "Sending test Email-Cousin-2"
swaks -s gw16131.fortimail.com -f bec@gmail.com -t sefrance@o365-fml.forti.pro --ehlo gmail.com --header "Subject:Test Cousin Domain Body $(date)" --body 'Voilà son adresse channel@o365-fml.froti.pro'

echo "Sending test Email-SPF"
to=$(shuf -n 1 ./user.txt)
swaks -s gw16131.fortimail.com -f spf@gmail.com -t sefrance@o365-fml.forti.pro --ehlo gmail.com --header "Subject:Test BEC $(date)" --body 'Test SPF'

#echo "Sending test Adult Image Analysis"
#cat ./adult.dat | swaks -s gw16131.fortimail.com -f adult@gmail.com -t sefrance@o365-fml.forti.pro --ehlo gmail.com --data -

echo "Sending test Email-AV-ZIP"
swaks -s gw16131.fortimail.com -f av-zip@gmail.com -t sefrance@o365-fml.forti.pro --ehlo gmail.com --header "Subject:Test AV ZIP $(date)" --body ./eicar.com.zip
echo -n | swaks -s gw16131.fortimail.com -f av-zip@gmail.com -t sefrance@o365-fml.forti.pro --attach-name eicar_niveau2.zip --ehlo gmail.com --header "Subject:Test AV ZIP $date" --body 'Test AV ZIP' --attach -

rm -f ./downloads/*
