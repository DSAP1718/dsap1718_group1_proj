# Speech Analytics Using Spectrogram Excel GUI Analyzer

This projet is desgined to creatre a spectrogram from an recorded audio from matlab and then the excel will compute the window function given the parameters of window lenght and hop size, Fast fourier transform with the parameters of the FFT size, and lastly to compute the spectrogram of the samples. finally exporting the data back to matlab and generate a .bmp file of the grayscaled image.

# Instructions

#### 1.) Matlab GUI
- Run the SpectrogramMain.m and it will show an interface with a record time. 
- Enter desired amount of time matlab will record
- After recording, another window will show and it will export the sample values to the first sheet name [Raw Data] 
#### 2.) Excel GUI 
- After exporting the data from matlab to excel. The first sheet will contain the samples.
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
-  Calculate window 
-- This will print out values of the windows given the *window* in the parameter fields
- Calculate FFT of Windows 
-- This will caculate the FFT of each windows. 
- Normalise 
-- This will normalise the values of the FFT
- Spectrogram
-- This will compute for the magnitude of each window and the grayscaled values of each windows. This will also print the greyscaled values to sheet 3 for matlab importation.

##### 2.1) Parameters
- FFT Size
-- The size of Radix That it will perform
- Window
-- The lenght of each window. This will be equal to FFT size.
-- *Futher updates will replace this to hanning size*
- Overlap/Hop size
-- The hop size for each window, also determined the overlap of each window

#### 3.) Back to Matlab
- Running the *generateSpec.m* will create a .bmp file of the values from the excel.

# Future Update
The team is currently developing the application to allow larger size of the FFT. because the FFT size is striclty at 32 radix and also improving the output of the program.