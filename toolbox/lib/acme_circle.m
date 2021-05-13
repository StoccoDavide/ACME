% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%                                                                     %
% The ACME project                                                    %
%                                                                     %
% Copyright (c) 2020-2021, Davide Stocco and Enrico Bertolazzi.       %
%                                                                     %
% The ACME project and its components are supplied under the terms of %
% the open source BSD 2-Clause License. The contents of the ACME      %
% project and its components may not be copied or disclosed except in %
% accordance with the terms of the BSD 2-Clause License.              %
%                                                                     %
% URL: https://opensource.org/licenses/BSD-2-Clause                   %
%                                                                     %
%    Davide Stocco                                                    %
%    Department of Industrial Engineering                             %
%    University of Trento                                             %
%    e-mail: davide.stocco@unitn.it                                   %
%                                                                     %
%    Enrico Bertolazzi                                                %
%    Department of Industrial Engineering                             %
%    University of Trento                                             %
%    e-mail: enrico.bertolazzi@unitn.it                               %
%                                                                     %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

classdef acme_circle < acme_entity
  %
  % Class container for ACME circle object
  %
  methods
    function self = acme_circle( varargin )
      % Create a new C++ pointer to circle object instance
      self.objectHandle = mex_circle( 'new', varargin{:} );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function delete( self )
      % Create C++ pointer to circle object instance
      mex_circle( 'delete', self.objectHandle );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = getRadius( self )
      % Get circle radius
      P = mex_circle( 'getRadius', self.objectHandle );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = getCenter( self )
      % Get circle center as ACME point object
      P = acme_point();
      P.objectHandle = mex_circle( 'getCenter', self.objectHandle );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = getNormal( self )
      % Get circle normal
      P = mex_circle( 'getNormal', self.objectHandle );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function setRadius( self, radius )
      % Set circle radius
      mex_circle( 'setRadius', self.objectHandle, radius );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function setCenter( self, other_obj )
      % Set circle center with an ACME point object
      mex_circle( 'setCenter', self.objectHandle, other_obj.objectHandle );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function setNormal( self, other_obj )
      % Set circle normal
      mex_circle( 'setNormal', self.objectHandle, other_obj );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function copy( self, other_obj )
      % Copy segment object from another segment
      if (other_obj.type() == "circle")
        mex_circle( 'copy', self.objectHandle, other_obj.objectHandle );
      else
        error('mex_circle::copy(): other_obj must be an ACME circle object type.');
      end
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function translate( self, other_obj )
     % Translate circle by vector
      mex_circle( 'translate', self.objectHandle, other_obj.objectHandle );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function transform( self, varargin )
      % Transform circle by 4x4 affine transformation matrix
      mex_circle( 'transform', self.objectHandle, varargin{:} );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = isInside( self, other_obj )
      % Check if ACME point is inside the circle 
      if (other_obj.type() == "point")
        P = mex_circle( 'isInside', self.objectHandle, other_obj.objectHandle );
      else
         error('mex_circle::isInside(): other_obj must be an ACME point object type.');
      end
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = isDegenerated( self )
      % Check if circle is degenerated
      P = mex_circle( 'isDegenerated', self.objectHandle );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = isApprox( self, other_obj )
      % Check if circles are approximatively equal
      if (other_obj.type() == "circle") 
        P = mex_circle( 'isApprox', self.objectHandle, other_obj.objectHandle );
      else
         error('mex_circle::isApprox(): other_obj must be an ACME circle object type.');
      end
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function normalize( self )
      % Normalize circle normal vector
      mex_circle( 'normalize', self.objectHandle );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = layingPlane( self )
     % Get circle laying plane
     P = acme_plane();
     P.objectHandle = mex_circle( 'layingPlane', self.objectHandle );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function reverse( self )
      % Reverse circle normal direction
      mex_circle( 'reverse', self.objectHandle );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = clamp( self )
      % Get circle minimum bounding box as ACME aabb object instance
      P = acme_aabb();
      P.objectHandle = mex_circle( 'clamp', self.objectHandle );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = perimeter( self )
      % Get circle perimeter
      P = mex_circle( 'perimeter', self.objectHandle );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = area( self )
      % Get circle perimeter
      P = mex_circle( 'area', self.objectHandle );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = isParallel( self, other_obj )
      % Check if circle is parallel to an ACME object
      P = mex_circle( 'isParallel', self.objectHandle, other_obj.objectHandle, other_obj.type() );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = isOrthogonal( self, other_obj )
      % Check if circle is orthogonal to an ACME object
      P = mex_circle( 'isOrthogonal', self.objectHandle, other_obj.objectHandle, other_obj.type() );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = isCollinear( self, other_obj )
      % Check if circle is collinear to an ACME object
      P = mex_circle( 'isCollinear', self.objectHandle, other_obj.objectHandle, other_obj.type() );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = isCoplanar( self, other_obj )
      % Check if circle is coplanar to an ACME object 
      P = mex_circle( 'isCoplanar', self.objectHandle, other_obj.objectHandle, other_obj.type() );
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = intersection( self, other_obj )
      % Intersect circle with an ACME object
      [Handle, type] = mex_circle( 'intersection', self.objectHandle, other_obj.objectHandle, other_obj.type() );
      P = eval( strcat( 'acme_', type, '()') );
      P.objectHandle = Handle;
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function disp( self )
      % Display object data
      disp( [ self.getCenter().get(),  self.getNormal()] ); %[self.getRadius() 0 0]',
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function plot( self, figure_name, color )
      % Plot circle object
      radius = self.getRadius();
      center = self.getCenter().get();
      normal = self.getNormal();
      % Original points, original plane
      t = linspace(0,2*pi);
      x = cos(t)*radius;
      y = sin(t)*radius;
      z = 0.0*t;
      pnts = [x;y;z];
      % Unit normal for original plane
      n0 = [0 0 1]'; 
      n0 = n0/norm(n0);
      % Unit normal for plane to rotate into plane is orthogonal to n1...
      % given by equatio: n1(1)*x + n1(2)*y + n1(3)*z = 0
      n1 = normal;
      n1 = n1/norm(n1); 
      % Angle between normals
      c = dot(n0,n1) / ( norm(n0)*norm(n1) );   % cos(theta)
      s = sqrt(1-c*c);                          % sin(theta)
      u = cross(n0,n1) / ( norm(n0)*norm(n1) ); % rotation axis...
      u = u/max(1e-12,norm(u));                            % ...as unit vector
      C = 1-c;
      % Rotation matrix
      R = [ u(1)^2*C+c,         u(1)*u(2)*C-u(3)*s, u(1)*u(3)*C+u(2)*s
            u(2)*u(1)*C+u(3)*s, u(2)^2*C+c,         u(2)*u(3)*C-u(1)*s
            u(3)*u(1)*C-u(2)*s, u(3)*u(2)*C+u(1)*s, u(3)^2*C+c
          ];
      % Rotated points
      newPnts = R*pnts;
      % Visualize
      figure_name;
      hold on;
      patch( center(1)+newPnts(1,:)', ...
             center(2)+newPnts(2,:)', ...
             center(3)+newPnts(3,:)', ...
             color, 'FaceAlpha', 0.5)
      hold off;
    end
    %
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %
    function P = type( self )
      % Get object type as string
      P = 'circle';
    end
  end
end
