# Speech Analytics Using Spectrogram Excel-GUI Analyzer

This project is designed to create a spectrogram using Fast Fourier Transform. The audio is recorded using MATLAB then the sample values will be computed by Fast Fourier Transform using Excel. In calculating the FFT, compute the window function given the parameters of window length and hop size, FFT with the parameters of the FFT size, and grayscale values for spectrogram. The output will be a .bmp file of the grayscale image.

# Instructions

#### 1.) MATLAB GUI
-Run the SpectrogramMain.m then it will show the interface of recording an audio.
-Enter desired amount of time that MATLAB will record the voice.
-Click the yes button when another window shows to export in Excel the sample values to Raw Data Sheet.

#### 2.) Excel GUI
-Run the Spectrogram.xlsm then the Raw Data Sheet will contain the sample values.
-Click the Functions sheet that contains 4 buttons:
-- Calculate Window
-- Calculate FFT of Windows
-- Normalize
-- Spectrogram
-With the parameters:
-- FFT Size
-- Window
-- Overlap/Hop size

##### 2.1) Buttons
-Calculate Window
-- Click this button to print out values of the windows given the window in the parameter fields.
-Calculate FFT of Windows
-- Click this button to caculate the FFT of each window.
-Normalize
-- Click this button to normalize the values of the FFT.
-Spectrogram
-- Click this button to compute for the magnitude of each window and the grayscaled values of each window. This will also print the greyscaled values to sheet 3 for Matlab importation.

##### 2.2) Parameters
-FFT Size
-- Type the size of radix that it will perform.
-Window
-- Type the length of each window. This will be equal to FFT size. -- Futher updates will replace this to hanning size
-Overlap/Hop size
-- Type the hop size for each window, also determined the overlap of each window.

#### 3.) MATLAB
-Run the generateSpec.m to create a .bmp file of the values from the excel.

# Future Update
The team is currently developing the application to allow larger size of the FFT because the FFT size is striclty at 32 radix and is also improving the output of the program.
