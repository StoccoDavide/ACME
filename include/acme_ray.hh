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
/// file: acme_ray.hh
///

#ifndef INCLUDE_ACME_RAY
#define INCLUDE_ACME_RAY

#include "acme.hh"
#include "acme_point.hh"

namespace acme
{

  /*\
   |
   |   _ __ __ _ _   _
   |  | '__/ _` | | | |
   |  | | | (_| | |_| |
   |  |_|  \__,_|\__, |
   |             |___/
  \*/

  //! Ray class container
  /**
   * Infinite ray in 3D space and defined by any point lying on the line and a
   * direction vector.
   */
  class ray : public entity
  {
  private:
    point m_origin;   //!< Ray origin point
    vec3 m_direction; //!< Ray direction vector

  public:
    //! Ray class destructor
    ~ray() {}

    //! Ray class constructor
    ray() {}

    //! Ray copy constructor
    ray(ray const &) = default;

    //! Ray move constructor
    ray(ray &&) = default;

    //! Ray class constructor
    ray(
        real origin_x,    //!< Input x value of ray origin point
        real origin_y,    //!< Input y value of ray origin point
        real origin_z,    //!< Input z value of ray origin point
        real direction_x, //!< Input x value of ray direction
        real direction_y, //!< Input y value of ray direction
        real direction_z  //!< Input z value of ray direction
    );

    //! Ray class constructor
    ray(
        point const &origin,  //!< Input ray origin point
        vec3 const &direction //!< Input ray direction vector
    );

    //! Equality operator
    ray &
    operator=(
        ray const &ray_in //!< Input ray object
    );

    //! Check if ray objects are (almost) equal
    bool
    isApprox(
        ray const &ray_in,       //!< Input ray object
        real tolerance = EPSILON //!< Tolerance
    ) const;

    //! Return ray origin point const reference
    point const &
    origin(void)
        const;

    //! Return ray direction vector const reference
    vec3 const &
    direction(void)
        const;

    //! Return ray origin point reference
    point &
    origin(void);

    //! Return ray direction vector reference
    vec3 &
    direction(void);

    //! Normalize ray direction vector
    void
    normalize(void);

    //! Convert ray to vector
    vec3
    toVector(void)
        const;

    //! Convert ray to normalized vector
    vec3
    toUnitVector(void)
        const;

    //! Reverse ray direction
    void
    reverse(void);

    //! Translate ray by vector
    void
    translate(
        vec3 const &vector //!< Input translation vector
        ) override;

    //! Transform ray with affine transformation matrix
    void
    transform(
        affine const &affine_in //!< 4x4 affine transformation matrix
        ) override;

    // Check whether the point is inside the ray
    bool
    isInside(
        point const &point_in,   //!< Query point
        real tolerance = EPSILON //!< Tolerance
    ) const;

    //! Check if ray is degenerated (null vector)
    bool
    isDegenerated(
        real tolerance = EPSILON //!< Tolerance
    ) const override;

    //! Return object hierarchical level
    integer level(void) const override { return 4; }

    //! Return object type as string
    std::string type(void) const override { return "ray"; }

    //! Check whether the object is no entity
    bool isNone(void) const override { return false; }

    //! Check whether the object is a point
    bool isPoint(void) const override { return false; }

    //! Check whether the object is a line
    bool isLine(void) const override { return false; }

    //! Check whether the object is a ray
    bool isRay(void) const override { return true; }

    //! Check whether the object is a plane
    bool isPlane(void) const override { return false; }

    //! Check whether the object is a segment
    bool isSegment(void) const override { return false; }

    //! Check whether the object is a triangle
    bool isTriangle(void) const override { return false; }

    //! Check whether the object is a disk
    bool isDisk(void) const override { return false; }

    //! Check whether the object is a ball
    bool isBall(void) const override { return false; }

    //! Check whether in the ray is clampable
    bool isClampable(void) const override { return false; }

    //! Check whether in the ray is non-clampable
    bool isNonClampable(void) const override { return true; }

    //! Get minumum and maximum values along axes
    bool
    clamp(
        vec3 &min, //!< Input minimum point
        vec3 &max  //!< Input maximum point
    ) const override;

    //! Get minumum and maximum values along axes
    bool
    clamp(
        real &min_x, //!< Input x value of minimum point
        real &min_y, //!< Input y value of minimum point
        real &min_z, //!< Input z value of minimum point
        real &max_x, //!< Input x value of maximum point
        real &max_y, //!< Input y value of maximum point
        real &max_z  //!< Input z value of maximum point
    ) const override;

  }; // class ray

  static ray const NAN_RAY = ray(NAN_POINT, NAN_VEC3); //!< Not-a-Number static const ray object
  static ray THROWAWAY_RAY = ray(NAN_RAY);             //!< Throwaway static non-const ray object

} // namespace acme

#endif

///
/// eof: acme_ray.hh
///