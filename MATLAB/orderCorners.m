function [A,B,C,D] = orderCorners(~)
    % Pixmap1
    % Corners= [
    %     99, 310;
    %     229, 189;
    %     197, 76;
    %     21, 29;
    % ];

    % Pixmap2
    % Corners= [
        % 156, 315;
        % 283, 297;
        % 339, 270;
        % 31, 30;
    % ];

    % Pixmap3
    Corners= [
        162, 483;
        464, 148;
        22, 36;
        197, 6;
    ];

    % Trouve l'abscisse minimum et son indice
    [xA, idxA] = min(Corners(:,1));
    yA = Corners(idxA+4);

    % Assigne l'abscisse minimum avec son ordonné au point A
    Corners( idxA, 1) = Corners( 1, 1);
    Corners( idxA, 2) = Corners( 1, 2);

    Corners(1, :) = [xA, yA];

    % Calcul des angles formés par chaque Corners avec A
    angleB = atand((Corners( 2, 2)-yA) / (Corners( 2, 1)-xA));
    angleC = atand((Corners( 3, 2)-yA) / (Corners( 3, 1)-xA));
    angleD = atand((Corners( 4, 2)-yA) / (Corners( 4, 1)-xA));

    angle = [angleB angleC angleD];

    % Tri par bulle des angles (ordre croissant)
    for n = 1:length(angle)-1
        for m = 1:length(angle)-n
            if angle(m) > angle(m + 1)
                % Tri des angles
                tmp1 = angle(m);
                angle(m) = angle(m + 1);
                angle(m + 1) = tmp1;
                % Tri des Corners
                tmp2 = Corners(m+1, :);             
                Corners(m+1, :) = Corners(m+2, :);
                Corners(m+2, :) = tmp2;
            end
        end
    end

    % Affichage
    disp(angle)
    disp(Corners)

    A = Corners( 1, :);
    B = Corners( 2, :);
    C = Corners( 3, :);
    D = Corners( 4, :);

end
