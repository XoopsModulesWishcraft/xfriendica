<?php
// $Id: xoops.crc.base.php 1.1.0 - XOOPSCRC 2008-08-15 9:22:20 wishcraft $
//  ------------------------------------------------------------------------ //
//                    CLORA - Chronolabs Australia                           //
//                         Copyright (c) 2008                                //
//                   <http://www.chronolabs.org.au/>                         //
//  ------------------------------------------------------------------------ //
//  This program is free software; you can redistribute it and/or modify     //
//  it under the terms of the SDPL Source Directive Public Licence           //
//  as published by Chronolabs Australia; either version 2 of the License,   //
//  (at your option) any later version.                                      //
//                                                                           //
//  You may not change or alter any portion of this comment or credits       //
//  of supporting developers from this source code or any supporting         //
//  source code which is considered copyrighted (c) material of the          //
//  original comment or credit authors.                                      //
//                                                                           //
//  This program is distributed in the hope that it will be useful,          //
//  but WITHOUT ANY WARRANTY; without even the implied warranty of           //
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            //
//  GNU General Public License for more details.                             //
//                                                                           //
//  You should have received a copy of the GNU General Public License        //
//  along with this program; if not, write to the Chronolab Australia        //
//  Chronolabs International PO BOX 699, DULWICH HILL, NSW, 2203, Australia  //
//  ------------------------------------------------------------------------ //

if (!class_exists('xoops_crc_base'))
{
	error_reporting(0);
	
	class xoops_crc_base extends xoops_crc
	{
	
		var $base;
		var $seed;
		var $mode;
		var $roll;
		var $num_evr;
		
		function __construct ($seed = 127)
		{
			if ($seed<1)
			{
				$this->seed = 1;
			} elseif ($seed>255) {
				$this->seed = 256;
			} else {
				$this->seed = $seed;
			}
			$base = $this->_set_base();
			return $this->get_base();
		}
		
		private function _set_base()
		{
			
			if ($this->seed < 65)
			{
				$case=true;
			} else {
				$case=false;
			}
			
			$this->roll = ($this->seed / (3+(1/6)));
			$this->num_evr = floor((34.32 / ($this->roll/$this->seed))/($this->seed*($this->roll/17.8)));
			
			if ($this->roll<16)
			{
				$this->mode = '1';
			} elseif ($this->roll >15 && $this->roll<32) {
				$this->mode = '2';
			} elseif ($this->roll >32 && $this->roll<48) {
				$this->mode = '3';
			} elseif ($this->roll >48 ) {
				$this->mode = '4';
			}
			
			if ($this->num_evr==0)
			{
				$this->num_evr = floor((($this->seed/$this->mode)/($this->mode*3.015)));
			} elseif ($this->num_evr>8) {
				$this->num_evr = $this->num_evr - floor($this->mode*1.35);
			}
				
			
						
			$this->base = array();
			switch ($this->mode){
			case 1:
				$ii = 0;
				$num = 0;
				$letter = "a";
				for ($qcb=1;$qcb<32;$qcb++)
				{
					$ii++;
					$done = false;
					if ($sofar == $this->num_evr)
					{
						if ($num < 9)
						{
							$this->base[$qcb] = $num;
							$num++;
							$sofar = 0;
							$done = true;
						}
					} else {
						$sofar++;
					}
					
					if ($done == false)
					{
						if (floor($qcb / ($this->roll/$this->num_evr))>$this->mode)
						{
							switch ($case)
							{
							case true:
								$this->base[$qcb] = $letter;
								break;
							case false:
								$this->base[$qcb] = strtoupper($letter);
								break;
							}
						} else {
							$this->base[$qcb] = $letter;
						}
						$letter++;
						if (strlen($letter++)>1) { $letter="a"; }
					}
				}

				for ($qcb=64;$qcb>31;$qcb--)
				{
					$ii++;
					$done = false;
					if ($sofar == $this->num_evr)
					{
						if ($num < 9)
						{
							$this->base[$qcb] = $num;
							$num++;
							$sofar = 0;
							$done = true;
						}
					} else {
						$sofar++;
					}
					
					if ($done == false)
					{
						if (floor($qcb / ($this->roll/$this->num_evr))>$this->mode)
						{
							switch ($case)
							{
							case true:
								$this->base[$qcb] = $letter;
								break;
							case false:
								$this->base[$qcb] = strtoupper($letter);
								break;
							}
						} else {
							$this->base[$qcb] = $letter;
						}
						$letter++;
						if (strlen($letter++)>1) { $letter="a"; }
					}
				}
				break;
			case 2:
				$ii = 0;
				$num = 0;
				$letter = "a";
				for ($qcb=32;$qcb>0;$qcb--)
				{
					$ii++;
					$done = false;
					if ($sofar == $this->num_evr)
					{
						if ($num < 9)
						{
							$this->base[$qcb] = $num;
							$num++;
							$sofar = 0;
							$done = true;
						}
					} else {
						$sofar++;
					}
					
					if ($done == false)
					{
						if (floor($qcb / ($this->roll/$this->num_evr))>$this->mode)
						{
							switch ($case)
							{
							case true:
								$this->base[$qcb] = $letter;
								break;
							case false:
								$this->base[$qcb] = strtoupper($letter);
								break;
							}
						} else {
							$this->base[$qcb] = $letter;
						}
						$letter++;
						if (strlen($letter++)>1) { $letter="a"; }
					}
				}

				for ($qcb=32;$qcb<65;$qcb++)
				{
					$ii++;
					$done = false;
					if ($sofar == $this->num_evr)
					{
						if ($num < 9)
						{
							$this->base[$qcb] = $num;
							$num++;
							$sofar = 0;
							$done = true;
						}
					} else {
						$sofar++;
					}
					
					if ($done == false)
					{
						if (floor($qcb / ($this->roll/$this->num_evr))>$this->mode)
						{
							switch ($case)
							{
							case true:
								$this->base[$qcb] = $letter;
								break;
							case false:
								$this->base[$qcb] = strtoupper($letter);
								break;
							}
						} else {
							$this->base[$qcb] = $letter;
						}
						$letter++;
						if (strlen($letter++)>1) { $letter="a"; }
					}
				}
				break;
			case 3:
				$ii = 0;
				$num = 0;
				$letter = "a";
				for ($qcb=1;$qcb<17;$qcb++)
				{
					$ii++;
					$done = false;
					if ($sofar == $this->num_evr)
					{
						if ($num < 9)
						{
							$this->base[$qcb] = $num;
							$num++;
							$sofar = 0;
							$done = true;
						}
					} else {
						$sofar++;
					}
					
					if ($done == false)
					{
						if (floor($qcb / ($this->roll/$this->num_evr))>$this->mode)
						{
							switch ($case)
							{
							case true:
								$this->base[$qcb] = $letter;
								break;
							case false:
								$this->base[$qcb] = strtoupper($letter);
								break;
							}
						} else {
							$this->base[$qcb] = $letter;
						}
						$letter++;
						if (strlen($letter++)>1) { $letter="a"; }
					}
				}

				for ($qcb=64;$qcb>47;$qcb--)
				{
					$ii++;
					$done = false;
					if ($sofar == $this->num_evr)
					{
						if ($num < 9)
						{
							$this->base[$qcb] = $num;
							$num++;
							$sofar = 0;
							$done = true;
						}
					} else {
						$sofar++;
					}
					
					if ($done == false)
					{
						if (floor($qcb / ($this->roll/$this->num_evr))>$this->mode)
						{
							switch ($case)
							{
							case true:
								$this->base[$qcb] = $letter;
								break;
							case false:
								$this->base[$qcb] = strtoupper($letter);
								break;
							}
						} else {
							$this->base[$qcb] = $letter;
						}
						$letter++;
						if (strlen($letter++)>1) { $letter="a"; }
					}
				}

				for ($qcb=32;$qcb>16;$qcb--)
				{
					$ii++;
					$done = false;
					if ($sofar == $this->num_evr)
					{
						if ($num < 9)
						{
							$this->base[$qcb] = $num;
							$num++;
							$sofar = 0;
							$done = true;
						}
					} else {
						$sofar++;
					}
					
					if ($done == false)
					{
						if (floor($qcb / ($this->roll/$this->num_evr))>$this->mode)
						{
							switch ($case)
							{
							case true:
								$this->base[$qcb] = $letter;
								break;
							case false:
								$this->base[$qcb] = strtoupper($letter);
								break;
							}
						} else {
							$this->base[$qcb] = $letter;
						}
						$letter++;
						if (strlen($letter++)>1) { $letter="a"; }
					}
				}
				
				
				for ($qcb=32;$qcb<48;$qcb++)
				{
					$ii++;
					$done = false;
					if ($sofar == $this->num_evr)
					{
						if ($num < 9)
						{
							$this->base[$qcb] = $num;
							$num++;
							$sofar = 0;
							$done = true;
						}
					} else {
						$sofar++;
					}
					
					if ($done == false)
					{
						if (floor($qcb / ($this->roll/$this->num_evr))>$this->mode)
						{
							switch ($case)
							{
							case true:
								$this->base[$qcb] = $letter;
								break;
							case false:
								$this->base[$qcb] = strtoupper($letter);
								break;
							}
						} else {
							$this->base[$qcb] = $letter;
						}
						$letter++;
						if (strlen($letter++)>1) { $letter="a"; }
					}
				}
				break;			
			case 4:
				$ii = 0;
				$num = 0;
				$letter = "a";

				for ($qcb=17;$qcb>0;$qcb--)
				{
					$ii++;
					$done = false;
					if ($sofar == $this->num_evr)
					{
						if ($num < 9)
						{
							$this->base[$qcb] = $num;
							$num++;
							$sofar = 0;
							$done = true;
						}
					} else {
						$sofar++;
					}
					
					if ($done == false)
					{
						if (floor($qcb / ($this->roll/$this->num_evr))>$this->mode)
						{
							switch ($case)
							{
							case true:
								$this->base[$qcb] = $letter;
								break;
							case false:
								$this->base[$qcb] = strtoupper($letter);
								break;
							}
						} else {
							$this->base[$qcb] = $letter;
						}
						$letter++;
						if (strlen($letter++)>1) { $letter="a"; }
					}
				}

				for ($qcb=17;$qcb<49;$qcb++)
				{
					$ii++;
					$done = false;
					if ($sofar == $this->num_evr)
					{
						if ($num < 9)
						{
							$this->base[$qcb] = $num;
							$num++;
							$sofar = 0;
							$done = true;
						}
					} else {
						$sofar++;
					}
					
					if ($done == false)
					{
						if (floor($qcb / ($this->roll/$this->num_evr))>$this->mode)
						{
							switch ($case)
							{
							case true:
								$this->base[$qcb] = $letter;
								break;
							case false:
								$this->base[$qcb] = strtoupper($letter);
								break;
							}
						} else {
							$this->base[$qcb] = $letter;
						}
						$letter++;
						if (strlen($letter++)>1) { $letter="a"; }
					}
				}

				for ($qcb=64;$qcb>48;$qcb--)
				{
					$ii++;
					$done = false;
					if ($sofar == $this->num_evr)
					{
						if ($num < 9)
						{
							$this->base[$qcb] = $num;
							$num++;
							$sofar = 0;
							$done = true;
						}
					} else {
						$sofar++;
					}
					
					if ($done == false)
					{
						if (floor($qcb / ($this->roll/$this->num_evr))>$this->mode)
						{
							switch ($case)
							{
							case true:
								$this->base[$qcb] = $letter;
								break;
							case false:
								$this->base[$qcb] = strtoupper($letter);
								break;
							}
						} else {
							$this->base[$qcb] = $letter;
						}
						$letter++;
						if (strlen($letter++)>1) { $letter="a"; }
					}
				}
				break;			
			}			
		}
		
		function get_base()
		{
			return $this->base;
		
		}		
		
		function debug_base()
		{
			$base = array();
			foreach ($this->base as $key => $data)
			{
				$base[$key] = array("char" => $data,
									"ord" => ord($data),
									"bin"  => decbin(ord($data)));
			}
			
			return array("mode" => $this->mode, "roll" => $this->roll,
						 "seed" => $this->seed, "mode" => $this->mode, 
						 "num_evr" => $this->num_evr, "base" => $this->base,
						 "debug" => $base);
		}
	}
}

?>