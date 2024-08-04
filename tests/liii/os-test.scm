;
; Copyright (C) 2024 The Goldfish Scheme Authors
;
; Licensed under the Apache License, Version 2.0 (the "License");
; you may not use this file except in compliance with the License.
; You may obtain a copy of the License at
;
; http://www.apache.org/licenses/LICENSE-2.0
;
; Unless required by applicable law or agreed to in writing, software
; distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
; WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
; License for the specific language governing permissions and limitations
; under the License.
;

(import (srfi srfi-78)
        (liii os)
        (scheme time))

(check-set-mode! 'report-failed)


(when (os-linux?)
  (check (os-type) => "Linux"))

(when (os-macos?)
  (check (os-type) => "Darwin"))

(when (os-windows?)
  (check (os-type) => "Windows"))

(when (not (os-windows?))
  (let ((t1 (current-second)))
    (os-call "sleep 3")
    (let ((t2 (current-second)))
      (check (> (ceiling (- t2 t1)) 3) => #t))))

(check-report)
(if (check-failed?) (exit -1))