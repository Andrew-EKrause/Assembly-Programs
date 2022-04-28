# *MIPS Assembly Programs*

## Description
**_Several Simple Programs in the MIPS Assembly Language_** <br/>
This repository contains six simple programs written in the MIPS Assembly language. MIPS is an acronym for Microprocessor without Interlocked Pipeline Stages. It was developed by Dr. John Hennessey and his graduate students at Stanford University in the 1980s. MIPS is a low-level language that communicates more directly with the computer's hardware. The language is not built like most modern assembly languages given that it has been simplified for educational purposes. You can find more information about the MIPS Assembly language here: https://www.d.umn.edu/~gshute/mips/mal-introduction.html. The assembly language programs in this project are run in a Mars simulator that is included in this repository as a Mars4_5.jar file. Each program performs a certain function such as repeatedly subtracting numbers, adding up a series of numbers, or recursively sorting an array. Details about each assembly program as well as how to run it are shown below the steps to setting up the Mars environment.

**Resources for Project:**
- MIPS Assembly Language
- Mars (IDE)

# Setting up the Mars Envrionment
## Mars (IDE)
1. NOTE: For additional visual assistance, see the screenshots below under the "Screenshots for Setting up Mars Environment" section. You can access this section by scrolling down this page or clicking on the link: [Screenshots for Setting up Mars Environment](#screenshots-for-setting-up-mars-environment).
2. Click on the green `Code` button in the righthand corner of the project page (See `Screenshot 1.0` below for visual details).
3. Click the `Download Zip` option in the dropdown menu that appears after you click the green Code button.
4. Go to your `Downloads` on your computer and drag / move the zipped folder onto your Desktop or any location that is easy for you to access.
5. Double click on the zipped folder to open its contents. A folder called "Assembly-Programs-master" should appear in the same location as the zipped file after you double click the zipped file to open it.
6. Double click on the "Assembly-Programs-master" folder to see its contents. Then double click on the Mars4_5.jar file to open it.
7. IMPORTANT: You will likely get an error saying that the Mars4_5.jar file cannot be opened because it is from an unidentified developer. To solve this issue, first navigate to your `System Preferences / Settings` on your computer (See `Screenshot 2.0` below for visual details).
8. In your System Preferences / Settings, click on the `Security and Privacy` icon / settings (See `Screenshots 3.0, 4.0, and 5.0` below for visual details).
9. Inside of the Security and Privacy settings, under the `General` tab, you should see a message that says: "Mars4_5.jar file was blocked from use because it is not from an identified developer." Click the `Open Anyway` button, which should be appearing alongside the message. (See `Screenshot 6.0` below for visual details).
10. After clicking the "Open Anyway" button, you will likely get a message that asks if you are sure that you want to open the Mars4_5.jar file. Click the "Open" button on the message (See `Screenshot 7.0` below for visual details).
11. Your Mars4_5.jar file should now open on your computer. See `Screenshot 8.0` if you want to compare what your Mars workspace looks like compared to the attached screenshot (they should look very similar).
12. See the following project descriptions below this step to run whichever assembly program you would like using the Mars environment. 
13. IMPORTANT: I would recommend starting with the first program, which is `helloprogram0mips.asm`. How you open the file in the Mars environment and run it is very similar to the other programs you can run in this project. However, "helloprgram0mips.asm" is the only assembly program that has detailed screenshots on opening and running it. The other programs follow the same process. If you are running a different program and cannot remember how to open a file, refer back to the "helloprogram0mips.asm" program screenshots for help.
14. For more information on the Mars environemnt (IDE), click the following link: http://courses.missouristate.edu/kenvollmar/mars/.

# Running the Assembly Programs
### Program 1: `helloprogram0mips.asm` (Refer back to screenshots here if you get stuck on running the other programs)
**_Simple Hello World Program_** <br/>
The program, when run, prints out a simple "Hello World" message in the Mars "Run I/O" tab. The value of a variable is also printed out as it is changed in a loop within the program. Steps to running the program are listed below:

1. First, click on "File" in the Mars environemnt. Then click "Open". A window should open where you can select a .asm file to open in the Mars environment.
###### Screenshots: Opening a File in the Mars Environment
![9](https://user-images.githubusercontent.com/57727121/131539271-39ae66da-1635-4001-b173-c47506e51ba5.png)
<img width="1440" alt="10" src="https://user-images.githubusercontent.com/57727121/131540318-610e8351-e838-4929-a2e1-ade18b7ed9d9.png">
<p>&nbsp;</p>

2. If you do not see any .asm files you can select to open, navigate to the project folder you downloaded from this repository. Select the "helloprogram0mips.asm" file. Click "Open".

3. To run the program, click on the "Run" option at the top of the Mars environment window, and then click "Assemble".
###### Screenshot: Assembling a Program in the Mars Environment
![11](https://user-images.githubusercontent.com/57727121/131542937-dc2fc1b3-c102-4ae8-8d63-76a9bed5df76.png)
<p>&nbsp;</p>

4. You should recieve a message in the "Mars Messages" tab at the bottom of the Mars environment window indicating that the execution completed successfully (See the screenshot shown below).
###### Screenshot: Confirmation Message after Assembling Program
![12](https://user-images.githubusercontent.com/57727121/131543641-57ecfa17-5308-4858-a758-dba8ac397cc1.png)
<p>&nbsp;</p>

5. After you see the confirmation message, "execution completed successfully", click the green run icon (See screenshots shown below). The program should run, and you should see the output on the "Run I/O" tab at the bottom of the Mars environment window.
###### Screenshot: Green "Run" Icon
<img width="56" alt="Screen Shot 2021-08-31 at 11 51 44 AM" src="https://user-images.githubusercontent.com/57727121/131544148-785b608e-e076-4e61-b1ad-4ce6142536f2.png">
<p>&nbsp;</p>

###### Screenshot: Output of Program
![Screen Shot 2021-08-31 at 11 56 49 AM 2](https://user-images.githubusercontent.com/57727121/131544753-0cc0db2f-9dab-4a20-9e10-d40a22e6d4b9.png)
<p>&nbsp;</p>

6. At this point, the program should have been executed. Keep in mind that the more program files you open, the more tabs will appear in your Mars environment (each tab is for each program opened). To close a certain program down, click "File" and then click "Close" to close the program you want taken out of the Mars environment. Click "Close All" to take all the programs out of the Mars environement (See screenshot shown below).

###### Screenshot: Closing a Program File
![Screen Shot 2021-08-31 at 1 55 01 PM 2](https://user-images.githubusercontent.com/57727121/131560019-74ec1a1b-5abe-40ee-85ca-815ed6f61927.png)
<p>&nbsp;</p>

7. Try the other programs! Keep in mind that some of the programs will require you to enter some input in the form of numbers.
<p>&nbsp;</p>

### Program 2: `firstnumberlist.asm`
**_Program that Lists Numbers_** <br/>
The program displays 12 values in decreasing order by the value of 7. The program starts with the value of 700, and decrements the value from that point onward. The decrementation will be printed out on the screen. If you need to see any screenshots, which were shown in "Program 1: helloprogram0mips.asm", click the following link: [See screenshots on opening and running the program](#running-the-assembly-programs). Steps to running the program are listed below.

1. First, click on "File" in the Mars environemnt. Then click "Open". A window should open where you can select a .asm file to open in the Mars environment.
2. If you do not see any .asm files you can select to open, navigate to the project folder you downloaded from this repository. Select the "firstnumberlist.asm" file. Click "Open".
3. To run the program, click on the "Run" option at the top of the Mars environment window, and then click "Assemble".
4. You should recieve a message in the "Mars Messages" tab at the bottom of the Mars environment window indicating that the execution completed successfully.
5. After you see the confirmation message, "execution completed successfully", click the green run icon. The program should run, and you should see the output on the "Run I/O" tab at the bottom of the Mars environment window.
6. At this point, the program should have been executed. Keep in mind that the more program files you open, the more tabs will appear in your Mars environment (each tab is for each program opened). To close a certain program down, click "File" and then click "Close" to close the program you want taken out of the Mars environment. Click "Close All" to take all the programs out of the Mars environement.
<p>&nbsp;</p>

### Program 3: `indicesum.asm`
**_Program that Sums the Numbers in an Array_** <br/>
The program adds together the indices of a while loop that runs 10 times. The previous value of the indice is printed off before being added to the value of the next indice. After the program is run, the following values should appear in the "Run I/O" section of the Mars environment: 0 1 3 6 10 15 21 28 36 45. If you need to see any screenshots, which were shown in "Program 1: helloprogram0mips.asm", click the following link: [See screenshots on opening and running the program](#running-the-assembly-programs). Steps to running the program are listed below.

1. First, click on "File" in the Mars environemnt. Then click "Open". A window should open where you can select a .asm file to open in the Mars environment.
2. If you do not see any .asm files you can select to open, navigate to the project folder you downloaded from this repository. Select the "indicesum.asm" file. Click "Open".
3. To run the program, click on the "Run" option at the top of the Mars environment window, and then click "Assemble".
4. You should recieve a message in the "Mars Messages" tab at the bottom of the Mars environment window indicating that the execution completed successfully.
5. After you see the confirmation message, "execution completed successfully", click the green run icon. The program should run, and you should see the output on the "Run I/O" tab at the bottom of the Mars environment window.
6. At this point, the program should have been executed. Keep in mind that the more program files you open, the more tabs will appear in your Mars environment (each tab is for each program opened). To close a certain program down, click "File" and then click "Close" to close the program you want taken out of the Mars environment. Click "Close All" to take all the programs out of the Mars environement.
<p>&nbsp;</p>

### Program 4: `listnumbers.asm`
**_Program that Lists Numbers with Additional Features_** <br/>
This program is slightly different compared to programs 1-3. The program requires the user to enter in a numerical value in the "Run I/O" tab at the bottom of the Mars environment. The program then takes that numerical value and subtracts the value of 7 from it 12 times. The original value entered by the user as well as the results of the subtractions made on that value are printed out within the "Run I/O" tab at the bottom of the Mars environment after the program finishes running. If you need to see any screenshots for opening the file, which were shown in "Program 1: helloprogram0mips.asm", click the following link: [See screenshots on opening and running the program](#running-the-assembly-programs). Steps to running the program are listed below.

1. First, click on "File" in the Mars environemnt. Then click "Open". A window should open where you can select a .asm file to open in the Mars environment.
2. If you do not see any .asm files you can select to open, navigate to the project folder you downloaded from this repository. Select the "listnumbers.asm" file. Click "Open".
3. To run the program, click on the "Run" option at the top of the Mars environment window, and then click "Assemble".
4. You should recieve a message in the "Mars Messages" tab at the bottom of the Mars environment window indicating that the execution completed successfully.
5. After you see the confirmation message, "execution completed successfully", click the green run icon. The program should run, and you should see the output on the "Run I/O" tab at the bottom of the Mars environment window.
6. <u>ENTER INPUT (Number):<u/> Enter a numerical value in the "Run I/O" tab window, and hit your `ENTER / RETURN` keyboard on your computer. The program should then execute.
7. At this point, the program should have been executed. Keep in mind that the more program files you open, the more tabs will appear in your Mars environment (each tab is for each program opened). To close a certain program down, click "File" and then click "Close" to close the program you want taken out of the Mars environment. Click "Close All" to take all the programs out of the Mars environement.
<p>&nbsp;</p>

### Program 5: `recursivesort.asm`
**_Program that Recursively Sorts an Array_** <br/>
Like `Program 4`, this program requires the user to enter in some numerical input in order the program to execute. The program recursively sorts through an array of values, and displays the value in numerical order from least to greatest. If you need to see any screenshots for opening the file, which were shown in "Program 1: helloprogram0mips.asm", click the following link: [See screenshots on opening and running the program](#running-the-assembly-programs). Steps to running the program are listed below.

1. First, click on "File" in the Mars environemnt. Then click "Open". A window should open where you can select a .asm file to open in the Mars environment.
2. If you do not see any .asm files you can select to open, navigate to the project folder you downloaded from this repository. Select the "recursivesort.asm" file. Click "Open".
3. To run the program, click on the "Run" option at the top of the Mars environment window, and then click "Assemble".
4. You should recieve a message in the "Mars Messages" tab at the bottom of the Mars environment window indicating that the execution completed successfully.
5. After you see the confirmation message, "execution completed successfully", click the green run icon. The program should run, and you should see the output on the "Run I/O" tab at the bottom of the Mars environment window.
6. ENTER INPUT (Number for array size): Enter a numerical value in the "Run I/O" tab window. This number will represent the size of your array. Remeber, the number you enter here corresponds to the number of values you will have to enter after you hit your `ENTER / RETURN` keyboard on your computer. For example, if I enter the value of `3` in the "Run I/O" window, I will have to enter three other numbers (see the next step below).
7. ENTER INPUT (Number value(s) in array): In the same "Run I/O" window, enter the numbers that will go into the array. Remember that the number of numerical values you enter here depends on the number you entered in the last step. In the last step, I used the value of `3` for the size of the array. So I could enter 12, -3, and 27 as the `3` values in my array. I specified three numbers (make them all different from each other) to put in the array. Each time you enter a number, you need to hit the `ENTER / RETURN` keyboard on your computer before entering the next number. After you enter the last number and hit `ENTER / RETURN`, the program should execute.
8. At this point, the program should have been executed. Keep in mind that the more program files you open, the more tabs will appear in your Mars environment (each tab is for each program opened). To close a certain program down, click "File" and then click "Close" to close the program you want taken out of the Mars environment. Click "Close All" to take all the programs out of the Mars environement.
<p>&nbsp;</p>

### Program 6: `simplesort.asm`
**_Program that uses the Simple Sort Algorithm on Arrays_** <br/>
This program is very similar to `Program 5`. However, a key difference is that the program utilizes the a simple sorting algorithm as opposed to recursion. If you want additional information on different kinds of simple sorts, click the following link: https://www.geeksforgeeks.org/sorting-algorithms/. If you need to see any screenshots for opening the file, which were shown in "Program 1: helloprogram0mips.asm", click the following link: [See screenshots on opening and running the program](#running-the-assembly-programs). Steps to running the program are listed below. The steps are very similar to `Program 5`.
  
1. First, click on "File" in the Mars environemnt. Then click "Open". A window should open where you can select a .asm file to open in the Mars environment.
2. If you do not see any .asm files you can select to open, navigate to the project folder you downloaded from this repository. Select the "simplesort.asm" file. Click "Open".
3. To run the program, click on the "Run" option at the top of the Mars environment window, and then click "Assemble".
4. You should recieve a message in the "Mars Messages" tab at the bottom of the Mars environment window indicating that the execution completed successfully.
5. After you see the confirmation message, "execution completed successfully", click the green run icon. The program should run, and you should see the output on the "Run I/O" tab at the bottom of the Mars environment window.
6. ENTER INPUT (Number for array size): Enter a numerical value in the "Run I/O" tab window. This number will represent the size of your array. Remeber, the number you enter here corresponds to the number of values you will have to enter after you hit your `ENTER / RETURN` keyboard on your computer. For example, if I enter the value of `3` in the "Run I/O" window, I will have to enter three other numbers (see the next step below).
7. ENTER INPUT (Number value(s) in array): In the same "Run I/O" window, enter the numbers that will go into the array. Remember that the number of numerical values you enter here depends on the number you entered in the last step. In the last step, I used the value of `3` for the size of the array. So I could enter 12, -3, and 27 as the `3` values in my array. I specified three numbers (make them all different from each other) to put in the array. Each time you enter a number, you need to hit the `ENTER / RETURN` keyboard on your computer before entering the next number. After you enter the last number and hit `ENTER / RETURN`, the program should execute.
8. At this point, the program should have been executed. Keep in mind that the more program files you open, the more tabs will appear in your Mars environment (each tab is for each program opened). To close a certain program down, click "File" and then click "Close" to close the program you want taken out of the Mars environment. Click "Close All" to take all the programs out of the Mars environement.
<p>&nbsp;</p>

# Screenshots for Setting up Mars Environment
### [Click this Link to go Back to Steps for Setting Up the Mars Environment](#setting-up-the-mars-envrionment)
###### Screenshot 1.0: Obtain Project Files by Clicking the Green "Code" Button
<img width="1440" alt="1" src="https://user-images.githubusercontent.com/57727121/131527205-11332ed8-bce2-4fe7-9dd3-5ff9757ee0b5.png">

<p>&nbsp;</p>

###### Screenshot 2.0: You will Receive an Error Message that States you Cannot Open the File because it is from an Unidentified Developer
<img width="1016" alt="2" src="https://user-images.githubusercontent.com/57727121/131527822-6de4f767-1f7f-434f-8b82-4efb3d07f7cf.png">

<p>&nbsp;</p>

###### Screenshot 3.0: After Receiving the Error Message, go to System Preferences / Settings
<img width="398" alt="3" src="https://user-images.githubusercontent.com/57727121/131533138-7a9ae05b-fbeb-4ae1-8a13-4124c1bf4a1f.png">

<p>&nbsp;</p>

###### Screenshot 4.0: In System Preferences / Settings, find the "Security & Privacy" Icon
<img width="721" alt="4" src="https://user-images.githubusercontent.com/57727121/131533553-b4173e16-740b-4f90-a3b1-596cc2be601b.png">

<p>&nbsp;</p>

###### Screenshot 5.0: Within System Preferences / Settings, Click on the "Security & Privacy" Icon
<img width="75" alt="5" src="https://user-images.githubusercontent.com/57727121/131533625-40e7e97e-a7fa-4a5b-a219-4c738f3e667e.png">

<p>&nbsp;</p>

###### Screenshot 6.0: Within the "Security & Privacy" Settings, Click the "Open Anyway" Button
<img width="720" alt="6" src="https://user-images.githubusercontent.com/57727121/131534562-c38768cb-003f-4ba0-ac70-587d64f11fe2.png">

<p>&nbsp;</p>

###### Screenshot 7.0: After Clicking the "Open Anyway" Button, Click the "Open" Button in the Pop-up Message (if it appears)
<img width="839" alt="7" src="https://user-images.githubusercontent.com/57727121/131534944-fb19a6ef-0e58-420f-9e42-7486a63fb9b1.png">

<p>&nbsp;</p>

###### Screenshot 8.0: The Mars Environment should now Open
<img width="1434" alt="8" src="https://user-images.githubusercontent.com/57727121/131535532-cb835f84-bf97-45a8-b4ca-9e9cc9a8c491.png">

<p>&nbsp;</p>



**_@Author: Andrew Krause_** <br/>
*LinkedIn:* https://www.linkedin.com/in/andrew-krause-b6aa21179/ <br/>
*Portfolio:* https://andrewkrause.dev/ <br/>
*Instagram:* https://www.instagram.com/aek.krause/ <br/>
*Facebook:* https://www.facebook.com/andrew.krause.35325

