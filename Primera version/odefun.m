function yp = odefun(~,Y)
   yp = [Y(2);-(Y(1)-Y(7)).*1.0./((Y(1)-Y(7)).^2+(Y(3)-Y(5)).^2).^(3.0./2.0);Y(4);-(Y(3)-Y(5)).*1.0./((Y(1)-Y(7)).^2+(Y(3)-Y(5)).^2).^(3.0./2.0);Y(6);1.0./((Y(1)-Y(7)).^2+(Y(3)-Y(5)).^2).^(3.0./2.0).*(Y(3).*8.1e1-Y(5).*8.1e1);Y(8);1.0./((Y(1)-Y(7)).^2+(Y(3)-Y(5)).^2).^(3.0./2.0).*(Y(1).*8.1e1-Y(7).*8.1e1);Y(10);(Y(5)-Y(9)).*1.0./((Y(5)-Y(9)).^2+(Y(7)-Y(11)).^2).^(3.0./2.0)+1.0./((Y(1)-Y(11)).^2+(Y(3)-Y(9)).^2).^(3.0./2.0).*(Y(3).*8.1e1-Y(9).*8.1e1);Y(12);(Y(7)-Y(11)).*1.0./((Y(5)-Y(9)).^2+(Y(7)-Y(11)).^2).^(3.0./2.0)+1.0./((Y(1)-Y(11)).^2+(Y(3)-Y(9)).^2).^(3.0./2.0).*(Y(1).*8.1e1-Y(11).*8.1e1)];
end
