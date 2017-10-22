function generateSpec()
    ans = xlsread('Spectrogram.xlsm','Spectrogram');
    imwrite(uint8(ans),'spectrogram_out_excel.bmp','bmp')
    imshow(uint8(ans));
end