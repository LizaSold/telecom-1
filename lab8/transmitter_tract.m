clear all;
close all;

data = int16([0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 ...
              0 1 1 0 0 1 0 0 0 0 0 0 0 0 0 1 0 1 1 1 0 1 0 1 ...
              0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);

msg = transmit(data);
          
fid=fopen('test.sig', 'w','l');
fwrite(fid, msg, 'int16');
fclose(fid);

          
function message = transmit(data)
%% Parameters

PRS = int16([1;  1;  1;  1;  1;  1; -1; -1; -1; -1;  1;  1;  1;  1; -1;  1;
             1;  1; -1; -1; -1; -1;  1; -1;  1;  1; -1; -1;  1;  1; -1;  1;
             1; -1;  1;  1;  1;  1; -1;  1; -1; -1; -1; -1;  1;  1;  1; -1;
            -1;  1;  1; -1; -1; -1; -1;  1; -1; -1;  1; -1; -1; -1;  1; -1;
             1; -1;  1;  1;  1; -1;  1; -1;  1;  1;  1;  1; -1; -1;  1; -1;
            -1;  1; -1;  1;  1;  1; -1; -1;  1;  1;  1; -1; -1; -1; -1; -1;
            -1;  1;  1;  1; -1;  1;  1;  1; -1;  1; -1; -1;  1;  1;  1;  1;
            -1;  1; -1;  1; -1; -1;  1; -1;  1; -1; -1; -1; -1; -1; -1;  1;
            -1;  1; -1;  1; -1;  1; -1;  1;  1;  1;  1;  1; -1;  1; -1;  1;
             1; -1;  1; -1; -1; -1; -1; -1;  1;  1; -1;  1;  1;  1; -1;  1;
             1; -1;  1;  1; -1;  1; -1;  1;  1; -1; -1; -1; -1; -1;  1; -1;
             1;  1;  1; -1;  1;  1;  1;  1;  1; -1; -1; -1;  1;  1;  1;  1;
            -1; -1;  1;  1; -1;  1; -1; -1;  1;  1; -1;  1; -1;  1;  1;  1;
            -1; -1; -1;  1;  1; -1;  1; -1; -1; -1;  1; -1;  1;  1;  1;  1;
             1;  1;  1; -1;  1; -1; -1;  1; -1;  1;  1; -1; -1; -1;  1; -1;
             1; -1; -1;  1;  1; -1; -1; -1;  1;  1; -1; -1; -1; -1; -1; -1;
            -1;  1;  1; -1; -1;  1;  1; -1; -1;  1; -1;  1; -1;  1;  1; -1;
            -1;  1; -1; -1;  1;  1;  1;  1;  1;  1; -1;  1;  1; -1;  1; -1;
            -1;  1; -1; -1;  1; -1; -1;  1;  1; -1;  1;  1;  1;  1;  1;  1;
            -1; -1;  1; -1;  1;  1; -1;  1; -1;  1; -1; -1; -1; -1;  1; -1;
             1; -1; -1; -1;  1; -1; -1;  1;  1;  1; -1;  1;  1; -1; -1;  1;
            -1;  1;  1;  1;  1; -1;  1;  1; -1; -1; -1; -1;  1;  1; -1;  1;
            -1;  1; -1;  1; -1; -1;  1;  1;  1; -1; -1;  1; -1; -1; -1; -1;
             1;  1; -1; -1; -1;  1; -1; -1; -1; -1;  1; -1; -1; -1; -1; -1;
            -1; -1; -1;  1; -1; -1; -1;  1; -1; -1; -1;  1;  1; -1; -1;  1;
            -1; -1; -1;  1;  1;  1; -1;  1; -1;  1; -1;  1;  1; -1;  1;  1;
            -1; -1; -1;  1;  1;  1; -1; -1; -1;  1; -1; -1;  1; -1;  1; -1;
             1; -1; -1; -1;  1;  1; -1;  1;  1; -1; -1;  1;  1;  1;  1;  1;
            -1; -1;  1;  1;  1;  1; -1; -1; -1;  1; -1;  1;  1; -1;  1;  1;
             1; -1; -1;  1; -1;  1; -1; -1;  1; -1; -1; -1; -1; -1;  1; -1;
            -1;  1;  1; -1; -1;  1;  1;  1; -1;  1; -1; -1; -1;  1;  1;  1;
             1;  1; -1;  1;  1;  1;  1; -1; -1; -1; -1; -1;  1;  1;  1  ]);

         
interleaver = int16([  0; 133; 122; 111; 100;  89;  78;  67;  56;  45;  34;  23;
                      12;   1; 134; 123; 112; 101;  90;  79;  68;  57;  46;  35;
                      24;  13;   2; 135; 124; 113; 102;  91;  80;  69;  58;  47;
                      36;  25;  14;   3; 136; 125; 114; 103;  92;  81;  70;  59; 
                      48;  37;  26;  15;   4; 137; 126; 115; 104;  93;  82;  71;
                      60;  49;  38;  27;  16;   5; 138; 127; 116; 105;  94;  83; 
                      72;  61;  50;  39;  28;  17;   6; 139; 128; 117; 106;  95;
                      84;  73;  62;  51;  40;  29;  18;   7; 140; 129; 118; 107; 
                      96;  85;  74;  63;  52;  41;  30;  19;   8; 141; 130; 119;
                     108;  97;  86;  75;  64;  53;  42;  31;  20;   9; 142; 131;
                     120; 109;  98;  87;  76;  65;  54;  43;  32;  21;  10; 143; 
                     132; 121; 110;  99;  88;  77;  66;  55;  44;  33;  22;  11]);

         
N = length(data);
 
%% Convolution Encoder

trellis = poly2trellis(9, [753 561]);
convolved_signal = convenc(data, trellis);

%% Interleaver

interleaved_signal = convolved_signal(interleaver+1);
signal_matrix = reshape(interleaved_signal(1:N*2), [N*2/6, 6]);

%% Spread spectrum

y = int16(hadamard(64));
row_number = int16(zeros(1, N*2/6));
for k=1:N*2/6
    line = signal_matrix(k,:);
    row_number(k) = bi2de(line) + 1;
end

signal = y(row_number, :);
signal_to_modulate = reshape(signal', 1, []);

n_repeat = int16(length(signal_to_modulate) / length(PRS'));
n_compl  = length(signal_to_modulate) - length(PRS') * n_repeat; 

signal_to_modulate = signal_to_modulate .* [repmat(PRS', 1, n_repeat), PRS(1:n_compl)'];
signal_to_modulate = [PRS', signal_to_modulate];
    
%% BPSK modulation

mask = (signal_to_modulate == -1);
signal_to_modulate(mask) = 0;

IQ = pskmod(double(signal_to_modulate), 2);
%M = comm.BPSKModulator;
%IQ = M(signal_to_modulate')';
%add white gaussian noise
IQ = awgn(IQ, inf);
scatterplot(IQ);

% model oversampling by 2
IQ_oversampled = [IQ, IQ]; 
IQ_im_part=imag(IQ_oversampled);
IQ_re_part=real(IQ_oversampled);
IQ_record = [IQ_re_part, IQ_im_part];

%IQ_record= [IQ_record(101:180) IQ_record];

%% Calculate CRC-code

crc_gen = crc.generator('Polynomial', '0x1021');
crc = generate(crc_gen, data');
crc_send = crc(73:88);

%% Form message
message = int16(IQ_record);

end 