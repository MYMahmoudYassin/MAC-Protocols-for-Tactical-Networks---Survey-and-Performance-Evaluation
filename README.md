# MAC Protocols for Tactical Networks-Survey and Performance Evaluation
In this project, we compare three different backoff techniques which are the 802.11 protocol, Additive Increase Multiplicative Decrease (AIMD), and Multiplicative Increase Multiplicative Decrease (MIMD). the comparison in the simulation section delivers three main parameters which are packet loss, utilization, and frame delay for each of the three techniques. Furthermore, the paper illustrates the background in section two, after that in section 3, the article shows the related work in the past recent years. Section four explains the results and outcomes of the used methodology,and at last section ,five concludes the work done.<br />
This project was a part of class COE540 – Computer Networks -KFUPM-spring 2022
- Project members:
Mahmoud Yassin Mahmoud, Adnan Munir, and Ibrahim Albulushi
- Submitted to:
Dr. Ashraf S. Mahmoud <br />

For more information you can check the following documentation: **"Final_Report_540"**
## Results and Discussion:
In this section, we describe the simulation results and parameters used in the simulation. We simulate Carrier Sense Multiple Access with collision avoidance (CSMA/CA) with three different backoff techniques. The exponential backoff, Additive Increase Multiplicative Decrease (AIMD), and Multiplicative increase Multiplicative decrease (MIMD) are three linear congestion control protocols that are applied based on their congestion window (CW). This simulation result is considered hindered number of nodes, packet size 2K, different simulation times in seconds, and 6Mb/s data rate. Table 2 shows some system parameters used in the simulation.

![image](https://user-images.githubusercontent.com/106708838/171580316-3626f37f-042d-48e8-a2da-436deba4b641.png)

For the 100 nodes simulation run 1 to 5000 times and we calculate three performance metrics such as packet loss, utilization, and frame delay. When the collision occurs, the packet gets lost, and we set the collision flag to 1. So, for the above-discussed backoff techniques, we deduce the packet loss shown in figure 3.

![image](https://user-images.githubusercontent.com/106708838/171580503-0543e82f-ffd6-4735-ba78-92dd20d93bc7.png)

From figure 3 we can see that for the adaptive increase and multiplicative decrease (AIMD) packet loss rate is increasing and after 40 packets it is almost constant. An exponential backoff (802.11) packets are going to drop exponentially. The packet loss ratio goes decreasing for the multiplicative increase and multiplicative decrease (MIMD) because the number of packet losses is going to decrease with time. So MIMD performs better than AIMD and AIMD perform better than 802.11 with respect to packet loss ratio. A narrower contention window (CW) creates too many collisions for given network size, whereas a bigger window causes fewer transmission attempts. As a result, there is an optimal window size for each network size. The utilization of different CSMA/CA techniques is shown in figure 4. The best utilization for a maximum number of nodes is 99.9% for the MIMD system for 200 nodes. The additive increase and multiplicative decrease have the worst utilization for the system. IEEE802.11 achieves constant utilization for all number of nodes.

![image](https://user-images.githubusercontent.com/106708838/171580645-10515b43-9f41-4226-a278-569d7bb5d66d.png)

The third metric is frame delay which we computed. How much time a system takes to send a complete frame without collision. It includes the good time of the system. When a collision occurs, the system will back off according to the above three backoff strategies. It doesn’t include collision time. Figure 5 shows the frame delay for all three techniques.

![image](https://user-images.githubusercontent.com/106708838/171580757-63535143-2761-4a27-9ba5-c4cd7a5956b5.png)

AIMD has a lower frame delay with reference to multiplicative increase and multiplicative decrease (MIMD) has the largest delay time for transferring a complete frame. From overall results for CSMA/CA Additive increase and adaptive decrease (AIAD) backoff technique performs better for a higher number of nodes and tactical networks in terms of the above three discussed metrics.

## Conclusion:
The model's formulations were validated using packet-level simulations. In this work, we thoroughly explained and simulate the above-discussed backoff techniques for CSMA/CA. MAC protocol. We calculate different performance metrics and from that we can recommend the designer the following: 
- If the designer cares more about the utilization and packet loss we recommend him to use the MIMD as the backoff algorithm for his system. <br />
-  If the designer cares more about the delay time we recommend him to use the AIMD as the backoff algorithm for his system. <br />


Unfortunately, this is still not good enough for a special broadcasting scenario for tactical networks. For better results for tactical networks, CSMA/CA slot scheduling with real-time reinforcement learning could be used.
