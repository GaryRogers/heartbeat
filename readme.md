# Heartbeat

Ever have to answer the dreaded question: "Hey, did this job run?" I did. More often than I wanted to. So I looked around the Internet for 'Dead-Man-Switch' types of applications, something that would notify you if it didn't receive a check-in on a defined schedule. What I found wasn't expensive, given the rate for internet services, but, it was more than I could justify to a boss that was constrained by an organizational aversions to 1) the cloud and 2) repeating expenses. So. Heartbeats.

The conecpt of Heartbeats is simple. Every so often Heartbeats wakes up and checks all of it's charges and sees if they're past-due for a check in. If it finds any that are, it alerts. For developers it's easy to check in, you just hit an API end-point with a PUT request. You could even add that to the end of a crojob as a curl request rather than making an App Developer put the request in their code (though, it's better if it's defined at the end of a successful operation)

