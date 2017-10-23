# Speech Analytics Using Spectrogram Excel-GUI Analyzer

This project is designed to create a spectrogram using Fast Fourier Transform. The audio is recorded using MATLAB then the sample values will be computed by Fast Fourier Transform using Excel. In calculating the FFT, compute the window function given the parameters of window length and hop size, FFT with the parameters of the FFT size, and grayscale values for spectrogram. The output will be a .bmp file of the grayscale image.

# Instructions

#### 1.) Matlab GUI
- Run the SpectrogramMain.m and it will show an interface with a record time. 
- Enter desired amount of time Matlab will record.
- After recording, another window will show and it will export the sample values to the first sheet name [Raw Data] 
#### 2.) Excel GUI 
- After exporting the data from Matlab to Excel, the first sheet will contain the samples.
- The second sheet, the "*Functions*" sheet, will contain 4 buttons:
-- Calculate Window
-- Calculate FFT of Windows
-- Normalise
-- Spectrogram
- With the parameters:
-- FFT Size
-- Window
-- Overlap/Hop size

##### 2.1) Buttons 
-  Calculate Window 
-- This will print out values of the windows given the *window* in the parameter fields.
- Calculate FFT of Windows 
-- This will caculate the FFT of each window. 
- Normalize 
-- This will normalize the values of the FFT.
- Spectrogram
-- This will compute for the magnitude of each window and the grayscaled values of each window. This will also print the greyscaled values to sheet 3 for Matlab importation.

##### 2.1) Parameters
- FFT Size
-- The size of Radix that it will perform
- Window
-- The length of each window. This will be equal to FFT size.
-- *Futher updates will replace this to hanning size*
- Overlap/Hop size
-- The hop size for each window, also determined the overlap of each window.

#### 3.) Back to Matlab
- Running the *generateSpec.m* will create a .bmp file of the values from the excel.

# Future Update
The team is currently developing the application to allow larger size of the FFT because the FFT size is striclty at 32 radix and is also improving the output of the program.
