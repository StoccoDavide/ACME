/*
(***********************************************************************)
(*                                                                     *)
(* The ACME project                                                    *)
(*                                                                     *)
(* Copyright (c) 2020-2021, Davide Stocco and Enrico Bertolazzi.       *)
(*                                                                     *)
(* The ACME project and its components are supplied under the terms of *)
(* the open source BSD 2-Clause License. The contents of the ACME      *)
(* project and its components may not be copied or disclosed except in *)
(* accordance with the terms of the BSD 2-Clause License.              *)
(*                                                                     *)
(* URL: https://opensource.org/licenses/BSD-2-Clause                   *)
(*                                                                     *)
(*    Davide Stocco                                                    *)
(*    Department of Industrial Engineering                             *)
(*    University of Trento                                             *)
(*    e-mail: davide.stocco@unitn.it                                   *)
(*                                                                     *)
(*    Enrico Bertolazzi                                                *)
(*    Department of Industrial Engineering                             *)
(*    University of Trento                                             *)
(*    e-mail: enrico.bertolazzi@unitn.it                               *)
(*                                                                     *)
(***********************************************************************)
*/

///
/// file: acme_math.hh
///

#ifndef INCLUDE_ACME_MATH
#define INCLUDE_ACME_MATH

#include <cmath>

#include "acme.hh"

namespace acme
{

  /*\
   |   __  __       _   _     
   |  |  \/  | __ _| |_| |__  
   |  | |\/| |/ _` | __| '_ \ 
   |  | |  | | (_| | |_| | | |
   |  |_|  |_|\__,_|\__|_| |_|
   |                          
  \*/

  //! Checks if elements are almost equal
  bool
  isApprox(
      real value0_in,          //!< Input value 0
      real value1_in,          //!< Input value 1
      real tolerance = EPSILON //!< Tolerance
  );

  //! Transform ve3 with affine transformation matrix
  void
  transform(
      vec3 &vector,        //!< Input vector to be transformed
      affine const &matrix //!< 4x4 transformation matrix
  );

  //! Angle between vectors [rad]
  real
  angle(
      vec3 const vector0_in, //!< Input vector 0
      vec3 const vector1_in  //!< Input vector 1
  );

} // namespace acme

#endif

///
/// eof: acme_math.hh
///
