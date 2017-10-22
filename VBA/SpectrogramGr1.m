function SpectrogramGr1(t)
    if(t <= 0)
        t = 5;
    end
    % Record your voice for t seconds.
    recObj = audiorecorder;
    disp('Start speaking.')
    	(recObj, t);
    disp('End of Recording.');

    % Play back the recording.
    play(recObj);

    % Store data in double-precision array.
    myRecording = getaudiodata(recObj);
    y = getaudiodata(recObj);
    totalSample = (0:1:length(y)-1);
    totalSample = totalSample';
    save('Spectrogram_Matlab_Variables');
    plot(y);
    
    xlswrite(fullfile(pwd,'\Spectrogram.xlsm'),totalSample,'Raw Data','A2');
    xlswrite(fullfile(pwd,'\Spectrogram.xlsm'),y,'Raw Data','B2');
    xlswrite(fullfile(pwd,'\Spectrogram.xlsm'),length(y),'Raw Data','C2');
    
    pause(2);
    
    ExcelApp = actxserver('Excel.Application');
    ExcelApp.Workbooks.Open(fullfile(pwd,'\Spectrogram.xlsm'));
    ExcelApp.Run('clearCells',length(y)+2);
    
    ExcelApp.Quit;
    ExcelApp.release;    
    
    display('Done exporting values to excel');
end