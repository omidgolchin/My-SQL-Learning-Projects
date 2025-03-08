# Statistical Process Control (SPC) for Manufacturing Quality Monitoring

This project focused on improving the monitoring and control of a manufacturing process by implementing **statistical process control (SPC)** techniques. The main objective was to develop a more methodical approach to quality control, using **data-driven insights** to determine when process adjustments were necessary.

## Approach  

The approach taken involved analyzing historical manufacturing data stored in a **PostgreSQL database**. By utilizing **SQL window functions** and **nested queries**, we calculated **upper and lower control limits (UCL and LCL)** for product height, defining the acceptable range for manufactured parts.  

These limits were based on a **rolling window of 5 items**, considering the **average height** and **standard deviation**.  

### Key Aspects  

- **Data Analysis**: Examined the `manufacturing_parts` table, containing item dimensions and operating machine data.  
- **Control Limit Calculation**: Used SQL **window functions** to compute the **average height**, **standard deviation**, **UCL**, and **LCL** for each set of **5 consecutive items** per operator.  
- **Alert System**: Implemented a **Boolean flag** to indicate whether a product's height fell outside the calculated control limits.  
- **Result Presentation**: The final query returned a structured dataset including:
  - `operator`
  - `row_number`
  - `height`
  - `average height`
  - `standard deviation`
  - `UCL`
  - `LCL`
  - `alert flag`

## Challenges and Solutions  

### 1. Handling Incomplete Windows  
**Problem**: The first four rows for each operator contained incomplete data for the rolling window.  
**Solution**: Used the `ROW_NUMBER()` function and filtered out rows where `row_number < 5`.  

### 2. Nested Query Structure  
**Problem**: Structuring the query to first compute necessary values and then apply alert logic required careful planning.  
**Solution**: Used a **nested query** approach to maintain query readability and manageability.  

### 3. Boolean Alert Flag  
**Problem**: Implementing the alert flag required a concise and efficient way to check out-of-control values.  
**Solution**: Used the `NOT BETWEEN` clause creatively in the **outer query** to directly determine whether a height was outside the control limits.  
