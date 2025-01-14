/* Copyright (c) 1993-2015, NVIDIA CORPORATION. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *  * Neither the name of NVIDIA CORPORATION nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#include <math.h>

void randomize(float& x, float& y, float& z);

class v3
{
public:
	float x;
	float y;
	float z;
	
	v3();
	v3(float xIn, float yIn, float zIn);
	void randomize();
	__host__ __device__ void normalize();
	__host__ __device__ void scramble();

};

v3::v3()
{
	::randomize(x, y, z);
}

v3::v3(float xIn, float yIn, float zIn) : x(xIn), y(yIn), z(zIn)
{}

void v3::randomize()
{
	::randomize(x, y, z);
}

__host__ __device__ void v3::normalize()
{
	float t = sqrt(x*x + y*y + z*z);
	x /= t;
	y /= t;
	z /= t;
}

__host__ __device__ void v3::scramble()
{
	float tx = 0.317f*(x + 1.0) + y + z * x * x + y + z;
	float ty = 0.619f*(y + 1.0) + y * y + x * y * z + y + x;
	float tz = 0.124f*(z + 1.0) + z * y + x * y * z + y + x;
	x = tx;
	y = ty;
	z = tz;
}