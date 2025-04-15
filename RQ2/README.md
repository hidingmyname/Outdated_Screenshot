## RQ2: Feasibility of Simple Threshold

### Protocols

In this research question, we explore whether it is feasible to accurately identify outdated screenshots with a simple threshold. 

1. First, we extract all commits that repair outdated screenshots in RQ1. The commit is stored in `commit.txt`. For each commit, we calculate the time interval from this modification to the previous modification. Run the script as below:

    ```bash  
    chmod +x get.sh
    ./get.sh commit.txt > run_Test_1.txt
    ```

2. We find that the median time interval is 297 days. When we use 297 days as the threshold, 70.3%(1540 ) of screenshots are determined as outdated. The results is in `list_data.txt`.
3. As the VS Code documentation is under active maintenance, it should not have so many outdated screenshots. As a result, we suspect that the threshold leads to many false alarms. We sample 10% (`random_state=42`) data that are manually checked. 
4. After our manual inspection, we found that only 8 out of our sampled 154 screenshots are outdated. The results are listed in  `sampled_data.txt`. 

**Finding 3: It is infeasible to use a simple time interval threshold to accurately determine whether screenshots are outdated.**

