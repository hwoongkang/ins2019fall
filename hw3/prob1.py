import matplotlib.pyplot as plt
import numpy as np

def gravity(lat):
    g0 = 9.7803253359
    a = 0.00193185265241
    b = 0.00669437999013

    ss = np.sin(lat)**2
    nom = 1 + a * ss
    den = np.sqrt(1-b*ss)

    return g0 * nom / den

def deghr2rads(deghr):
    deg2rad = np.pi/180
    perhr2pers = 1/3600

    return deghr * deg2rad * perhr2pers

def deg2rad(deg):
    return deg * np.pi/180
earthrate = 7.292115 * 1E-5 # rad/s 

gyrs = [deghr2rads(1), deghr2rads(20)]

accs = [300*1E-6*gravity(0),5*1E-3*gravity(0)]

rolls = [[],[]]
pitchs = [[],[]]
yaws = [[],[]]
lats = []
deglat = 0

gravs = []

while deglat<=70:
    radlat = deg2rad(deglat)
    g = gravity(radlat)
    gravs.append(g)
    lats.append(deglat)
    for i in [0,1]:
        
        rolls[i].append(accs[i]/g)
        pitchs[i].append(accs[i]/g)
        yaws[i].append(gyrs[i]/earthrate/np.cos(radlat))
    deglat+=5


plt.subplots(3,2)

plt.subplot(3,2,1)

plt.plot(lats,rolls[0],'k')
plt.title("LN200")
plt.ylabel("roll error")

plt.subplot(3,2,2)
plt.title("HG1930")
b = plt.plot(lats,rolls[1],'r')


plt.subplot(3,2,3)
plt.plot(lats,pitchs[0],'k')
plt.ylabel("pitch error")
plt.subplot(3,2,4)
plt.plot(lats,pitchs[1],'r')

plt.subplot(3,2,5)
plt.plot(lats,yaws[0],'k')
plt.ylabel("yaw error[rad]")
plt.xlabel("latittude[deg]")
plt.subplot(3,2,6)
plt.plot(lats,yaws[1],'r')

plt.subplots_adjust(wspace = 0.5, hspace= 0.5)
plt.savefig("./figures/prob3.jpg")

plt.figure()
plt.plot(lats,gravs,'k')
plt.savefig('./figures/gravity_change.jpg')


plt.figure()
plt.plot(lats,rolls[0],'k')
plt.savefig('./figures/roll_error.jpg')
